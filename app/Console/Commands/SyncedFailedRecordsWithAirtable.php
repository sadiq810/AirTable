<?php

namespace App\Console\Commands;

use App\Http\Controllers\PeopleController;
use App\Models\People;
use App\Repositories\PeopleRepository;
use App\Utility\DataFormatter;
use Illuminate\Console\Command;

class SyncedFailedRecordsWithAirtable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'airtable:sync';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command will sync local cache records which are not present in Airtable and failed to sync with airtable during creation due to Airtable API rate limiting, Schedule this command according to your need.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info('Syncing local records with airtable started....');

        foreach (People::where('status', PeopleController::PENDING)->cursor() as $people) {
            $data = [
                'Name'  => $people->name,
                'Email' => $people->email
            ];

            if ($people->photo)
                $data['Photo'] = $people->photo;

            $response = (new \App\Services\People())->save($data);

            if ($response) {
                $data = (new DataFormatter())->single($response, PeopleController::SYNCED);
                (new PeopleRepository)->update($people->id, $data);
            } else {
                $this->error('Some records could not be synced.');
            }
        }

        $this->info('Syncing operation is completed.');
    }
}
