<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
class Inventaire extends Model
{
    public function enregistrements(){
        return $this->hasMany(Enregistrement::class);
    }

    public function format(){
        Carbon::setLocale('fr');
        return [
            'id' => $this->id,
            'enregistrements' => $this->enregistrements,
            'created_at' => $this->created_at->toDateTimeString(),
            'last_update' => $this->updated_at->diffForHumans(),
        ];
    }
}
