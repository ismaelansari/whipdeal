<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class SaveLinkData extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'save_link_data';
    protected $fillable = [
        'user_id','link'
    ];
}
