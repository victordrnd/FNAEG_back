<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Enregistrement extends Model
{
    protected $fillable = ['inventaire_id', 'CodeKit','Stock'];
}