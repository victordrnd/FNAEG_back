<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Laboratoire extends Model
{
    protected $table = "labos";

    protected $primaryKey = "CodeLab";

    public $timestamps = false;

    protected $fillable = ['CodeLab','Type', 'Ville'];
    
    public $incrementing = false;

    protected $keyType = 'string';

    
}
