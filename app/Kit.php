<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kit extends Model
{
    protected $table = "kits";

    protected $primaryKey = "codekit";

    public $timestamps = false;

    protected $fillable = ['codekit','prix', 'annee', 'duree','stock', 'codef'];
    
    public $incrementing = false;

    protected $keyType = 'string';

    public function fabricant(){
        return $this->belongsTo(Fabricant::class, "codef");
    }

}
