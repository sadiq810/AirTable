<?php


namespace App\Services;


use Illuminate\Support\Facades\Http;
use phpDocumentor\Reflection\Types\Boolean;

class People
{
    private $key;
    private $endpoint;

    public function __construct()
    {
        $this->key = env('AIR_TABLE_API_KEY');
        $this->endpoint = env('AIR_TABLE_END_POINT');
    }

    /**
     * @param int $maxRecords
     * @return array|bool
     * Get People list from Airtable.
     * Get People list from Airtable.
     * Max 100 records are retrieved at first.
     */
    public function get(int $maxRecords = 100): array|Boolean
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer '.$this->key
        ])->get($this->endpoint, [
            'maxRecords' => $maxRecords,
            'view' => 'Grid view'
        ]);

        return ($response->failed()) ? false : $response->json();
    }//..... end of get() .....//

    /**
     * @param array $fields
     * @return array|bool
     * Save a record in the airtable.
     */
    public function save(array $fields = []): array | bool
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer '.$this->key,
            'Content-Type'  => 'application/json'
        ])->post($this->endpoint, [
            'fields' => $fields
        ]);

        return ($response->failed()) ? false : $response->json();
    }//..... end of save() .....//
}//..... end of class.
