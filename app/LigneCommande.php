<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LigneCommande extends Model
{
    protected $fillable = ['CodeKit', 'Qte', 'commande_id'];
    protected $hidden = ['id','commande_id','created_at', 'updated_at'];

    public function kit(){
        return $this->belongsTo(Kit::class, 'CodeKit');
    }
}
