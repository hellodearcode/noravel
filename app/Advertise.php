<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Advertise extends Model
{
    protected $table = 'advertise';
    protected $fillable = ['name','image_name','status'];
    public $timestamps = false;
}