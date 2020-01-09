<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
class Commande extends Model
{
    protected $fillable = ['status_id'];
    public $appends = ['prix'];
    
    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    public function details(){
        return $this->hasMany(LigneCommande::class);
    }

    public function getPrixAttribute(){
        return $this->details->sum(function($ligne){
            return $ligne->kit->prix * $ligne->Qte;
        });
    }

    public function format(){
        Carbon::setLocale('fr');
        return [
            'id' => $this->id,
            'status' => $this->status->libelle,
            'status_id' => $this->status_id,
            'details' => $this->details,
            'prix' => $this->details->sum(function($ligne){
                return $ligne->kit->prix * $ligne->Qte;
            }),
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
            'last_created' => $this->created_at->diffForHumans(),
        ];
    }
}
