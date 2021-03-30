<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class People extends Model
{
    use HasFactory;

    protected $table = 'people';
    protected $guarded = ['id'];

    /**
     * @param $photo
     * @return array|mixed
     * Photo field accessor.
     */
    public function getPhotoAttribute($photo)
    {
        return $photo ? json_decode($photo, true) : [];
    }//..... end of getPhotoAttribute() .....//
}
