<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    protected $fillable = ['status_id'];
    
    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    public function kits()
    {
        return $this->belongsToMany(Kit::class, 'ligne_commandes', 'commande_id', 'CodeKit');
    }
}
