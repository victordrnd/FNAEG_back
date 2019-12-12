<?php

namespace App\Services;

use App\Inventaire;
use App\Enregistrements;

class InventaireService {

    public static function getAll(){
        return Inventaire::where('created_at', '!=', null)->with('enregistrements')->get();
    }


    public static function create(Request $req){
        $inventaire = Inventaire::create();
        foreach($req->kits as $kit){
            Enregistrement::create([
                'inventaire_id' => $inventaire->id,
                'CodeKit' => $kit['CodeKit'],
                'Stock' => $kit['Stock'] 
            ]);
        }
        return self::find($inventaire->id);
    }

    public static function find($id){
        return Inventaire::where('id', $inventaire->id)->with('enregistrements')->first();
    }
}