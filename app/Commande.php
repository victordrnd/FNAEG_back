<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
class Commande extends Model
{
    protected $fillable = ['status_id', 'creator_id'];
    public $appends = ['prix'];
    protected $hidden = ['creator_id'];
    
    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    public function details(){
        return $this->hasMany(LigneCommande::class);
    }

    public function creator(){
        return $this->belongsTo(User::class, 'creator_id')->withTrashed();
    }

    public function getPrixAttribute(){
        return $this->details->sum(function($ligne){
            return $ligne->kit->prix * $ligne->qte;
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
                return $ligne->kit->prix * $ligne->qte;
            }),
            'creator' => $this->creator,
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
            'last_created' => $this->created_at->diffForHumans(),
        ];
    }
}
