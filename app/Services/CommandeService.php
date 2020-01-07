<?php

namespace App\Services;

use Illuminate\Http\Request;
use App\Commande;
use App\Laboratoire;
use Carbon\Carbon;
use App\LigneCommande;
class CommandeService
{
    public static function getAll()
    {
        return Commande::orderBy('created_at', 'DESC')
            ->with('status', 'details')->get()->map->format();
    }


    public static function paginate(){

        return Commande::orderBy('created_at', 'DESC')
            ->with('status','details', 'details.kit', 'details.kit.fabricant')->paginate()->toArray();
    }


    public static function find($id){
        return Commande::where('id', $id)->with('status','details', 'details.kit', 'details.kit.fabricant')->first();
    }

    public static function create(Request $req)
    {
        $commande = Commande::create([
            'status_id' => 1
        ]);
        foreach ($req->lignes as $ligne) {
            LigneCommande::create([
                'CodeKit' => $ligne['CodeKit'],
                'Qte' => $ligne['Qte'],
                'commande_id' => $commande->id
            ]);
        }

        return self::find($commande->id);
    }



    public static function update(Request $req)
    {
        $commande = Commande::findOrFail($req->id);
        if($req->has('lignes')){
            foreach($req->lignes as $ligne){
                $lignecmd = LigneCommande::where('CodeKit', $ligne['CodeKit'])
                ->where('commande_id', $commande->id)->first();
                $lignecmd->update(['Qte' => $ligne['Qte']]);
            }
        }
        if($req->has('status_id')){
            $commande->update([
                'status_id' => $req->status_id
            ]);
        }
        return self::find($commande->id);
    }


    public static function stats(){
        $commandes = Commande::orderBy('created_at', 'desc')
            ->with('status', 'details')
            ->take(5)->get()->map->format();
        return $commandes;    
    }
}
