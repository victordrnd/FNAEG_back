<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    protected $table = "cdes";

    protected $primaryKey = ['CodeKit', 'CodeLab', 'DateCde'];

    public $timestamps = false;

    protected $fillable = ['CodeKit','CodeLab', 'DateCde', 'Qte'];
    
    public $incrementing = false;

    protected $keyType = 'string';


}
