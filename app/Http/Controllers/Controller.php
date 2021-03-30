<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * @param $file
     * @return string
     * Upload Image.
     */
    public function uploadImage($file)
    {
        try {
            $imageName = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads'), $imageName);

            return $imageName;
        } catch (\Exception $exception) {
            return false;
        }//..... end of try-catch() .....//
    }//..... end of uploadImage() .....//
}
