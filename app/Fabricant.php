<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Fabricant extends Model
{
    protected $table = "fabricants";

    protected $primaryKey = "CodeF";

    public $timestamps = false;

    protected $fillable = ['CodeF','Nom', 'Pays', 'Ville'];
    
    public $incrementing = false;

    protected $keyType = 'string';


    public function kits(){
        return $this->hasMany(Kit::class,'CodeF','CodeKit');
    }
}
