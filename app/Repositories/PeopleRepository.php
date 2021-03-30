<?php


namespace App\Repositories;


use App\Models\People;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Log;

class PeopleRepository
{
    /**
     * @param $records
     * Bulk insert.
     */
    public function bulkInsert($records): void
    {
        try {
            People::insert($records);
        } catch (\Exception $exception) {
            Log::error('Could not insert records into database: '. $exception->getMessage());
        }//..... end of try-catch() .....//
    }//...... end of bulkInsert() .....//

    /**
     * @return Collection
     * Fetch records from database.
     */
    public function list(): Collection
    {
        return People::all();
    }//..... end of list() .....//

    /**
     * @param int $limit
     * @return
     * Get Paginated Response.
     */
    public function paginate($limit = 5)
    {
        return People::paginate($limit);
    }//.... end of paginate() .....//

    /**
     * @param $data
     * @return mixed
     * Create new one.
     */
    public function create(array $data): People
    {
        return People::create($data);
    }//..... end of create() ...../

    /**
     * @param $data
     * @return mixed
     * Update existing record.
     */
    public function update(int $id, array $data): int
    {
        return People::whereId($id)->update($data);
    }//..... end of update() ...../
}
