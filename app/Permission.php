<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $fillable = ['libelle' , 'slug'];
    protected $hidden = ['created_at', 'updated_at', 'pivot'];
}
