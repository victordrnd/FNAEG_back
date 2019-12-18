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

    public function details(){
        return $this->hasMany(LigneCommande::class);
    }

    public function format(){
        return [
            'id' => $this->id,
            'status' => $this->status->libelle,
            'details' => $this->details,
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
        ];
    }
}
