<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class UserRegister extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'register_user';
    protected $fillable = [
        'register_user_data',
    ];
}
