<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LandingPage extends Model
{
    protected $table = 'landing_pages';
    
    public function getImageAttribute($image){
        if($image){
            return asset('public/landing/images/'.$image);
        }
        return asset('public/landing/images/image-not-available.png');
    }
}

