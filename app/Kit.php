<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kit extends Model
{
    protected $table = "kits";

    protected $primaryKey = "CodeKit";

    public $timestamps = false;

    protected $fillable = ['CodeKit','prix', 'Annee', 'Duree','Stock', 'CodeF'];
    
    public $incrementing = false;

    protected $keyType = 'string';


    public function fabricant(){
        return $this->belongsTo(Fabricant::class, "CodeF");
    }

}
