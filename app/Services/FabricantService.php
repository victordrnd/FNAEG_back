<?php


namespace App\Services;

use App\Fabricant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class FabricantService {

    public static function getAll(){
        return Fabricant::where('codef', '!=', null)->with('kits')->get();
    }

    public static function paginate(){
        return Fabricant::where('codef', '!=', null)->with('kits')->paginate()->toArray();
    }

    public static function find(Request $req){
        return Fabricant::where('codef', $req->codef)->with('kits')->first();
    }

    public static function delete(Request $req){
        Fabricant::destroy($req->codef);
    }

    public static function create(Request $req){
        return Fabricant::create([
            'codef' => $req->codef,
            'nom' => $req->nom,
            'pays' => $req->pays,
            'ville' => $req->ville
        ]);
    }

    public static function update(Request $req){
        $fabricant = Fabricant::findOrFail($req->codef);
        $fabricant->update($req->all());
        return $fabricant;
    }


    public static function minimized(){
        $fabricants = Fabricant::select('codef','nom')->get();
        return $fabricants;
    }

    public static function filter(Request $req){
        $fabricants = (new Fabricant)->newQuery();

        if ($req->has('keyword')) {
            $keyword = $req->keyword;
            $fabricants->where('nom', 'like', "$keyword%");
        }
        
        
        if ($req->has('ordersBy')) {
            foreach ($req->ordersBy as $item) {
                if (Schema::hasColumn('fabricants', $item['key'])) {
                    $fabricants->orderBy($item['key'], $item['value']);
                }
            }
        }
        return $fabricants->with('kits')->paginate()->toArray();
    }
}