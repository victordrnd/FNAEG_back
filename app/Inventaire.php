<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inventaire extends Model
{
    public function enregistrements(){
        return $this->hasMany(Enregistrement::class);
    }
}
