<?php

namespace App\Services;

use App\Inventaire;
use App\Enregistrement;
use Illuminate\Http\Request;

class InventaireService {

    public static function getAll(){
        return Inventaire::where('created_at', '!=', null)->orderBy('created_at', 'DESC')->with('enregistrements')->get();
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
        return Inventaire::where('id', $id)->with('enregistrements')->firstOrFail();
    }


    public static function delete($id){
        Enregistrement::where('inventaire_id', $id)->delete();
        Inventaire::destroy($id);
    }
}