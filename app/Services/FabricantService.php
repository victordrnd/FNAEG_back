<?php


namespace App\Services;

use App\Fabricant;
use Illuminate\Http\Request;

class FabricantService {

    public static function getAll(){
        return Fabricant::where('CodeF', '!=', null)->with('kits')->get();
    }

    public static function paginate(){
        return Fabricant::where('CodeF', '!=', null)->with('kits')->paginate()->toArray();
    }

    public static function find(Request $req){
        return Fabricant::where('CodeF', $req->CodeF)->with('kits')->first();
    }

    public static function delete(Request $req){
        Fabricant::destroy($req->CodeF);
    }

    public static function create(Request $req){
        return Fabricant::create([
            'CodeF' => $req->CodeF,
            'Nom' => $req->Nom,
            'Pays' => $req->Pays,
            'Ville' => $req->Ville
        ]);
    }

    public static function update(Request $req){
        $fabricant = Fabricant::findOrFail($req->CodeF);
        $fabricant->update($req->all());
        return $fabricant;
    }
}