<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LigneCommande extends Model
{
    protected $fillable = ['codekit', 'qte', 'commande_id'];
    protected $hidden = ['id','commande_id','created_at', 'updated_at'];

    public function kit(){
        return $this->belongsTo(Kit::class, 'codekit');
    }
}
