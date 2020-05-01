<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Enregistrement extends Model
{
    protected $fillable = ['inventaire_id', 'codekit','stock'];
    protected $hidden = ["created_at", "updated_at"];


    public function kit(){
        return $this->belongsTo(Kit::class, "codekit");
    }
}
