<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Fabricant extends Model
{
    protected $table = "fabricants";

    protected $primaryKey = "codef";

    public $timestamps = false;

    protected $fillable = ['codef','nom', 'pays', 'ville'];
    
    public $incrementing = false;

    protected $keyType = 'string';


    public function kits(){
        return $this->hasMany(Kit::class, 'codef','codef');
    }
}
