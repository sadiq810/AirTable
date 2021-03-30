<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PeopleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'            => $this->id,
            'airtable_id'   => $this->airtable_id,
            'name'          => $this->name,
            'email'         => $this->email,
            'photo'         => $this->getImage($this->photo),
            'thumbnail'     => $this->getThumbnail($this->photo)
        ];
    }

    /**
     * @param $photo
     * @return string
     * Take out full image from the photo array.
     */
    private function getImage(array $photo): string
    {
        return $photo[0]['url'] ?? '';
    }//..... end of getImage() .....//

    /**
     * @param array $photo
     * @return string
     * Take out thumbnail from photo array.
     */
    private function getThumbnail(array $photo): string
    {
        return $photo[0]['thumbnails']['small']['url'] ?? $photo[0]['url'] ?? '';
    }//..... end of getThumbnail() ....//
}
