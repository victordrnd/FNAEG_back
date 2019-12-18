<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LigneCommande extends Model
{
    protected $fillable = ['CodeKit', 'Qte', 'commande_id'];
}
