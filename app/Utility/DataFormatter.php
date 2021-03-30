<?php


namespace App\Utility;


class DataFormatter
{
    /**
     * @param $records
     * @return array
     * Format list of record.
     */
    public function list(array $records): array
    {
        $data = [];

        foreach ($records as $record)
            $data[] = $this->single($record);

        return $data;
    }//..... end of list() .....//

    /**
     * @param array $record
     * @param int $status
     * @return array
     * Format single record.
     */
    public function single(array $record, $status = 1): array
    {
        return [
            'airtable_id'   => $record['id'],
            'name'          => $record['fields']['Name'] ?? '',
            'email'         => $record['fields']['Email'] ?? '',
            'photo'         => json_encode($record['fields']['Photo'] ?? []),
            'status'        => $status
        ];
    }//..... end of single() .....//
}//..... end of class.
