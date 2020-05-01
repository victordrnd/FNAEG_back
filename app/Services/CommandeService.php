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
            ->with('status','details', 'details.kit', 'details.kit.fabricant', 'creator')->paginate()->toArray();
    }


    public static function filter(Request $req){
        $commandes = (new Commande)->newQuery();
        if ($req->has('creators')) {
            if(!empty($req->creators)){
                $commandes->whereIn('creator_id', $req->creators);
            }
        }

        return $commandes->orderBy('created_at', 'DESC')
        ->with('status','details', 'details.kit', 'details.kit.fabricant', 'creator')->paginate()->toArray();
    }


    public static function find($id){
        return Commande::where('id', $id)->with('status','details', 'details.kit', 'details.kit.fabricant')->first();
    }

    public static function create(Request $req)
    {
        $commande = Commande::create([
            'status_id' => 1,
            'creator_id' => auth()->user()->id
        ]);
        foreach ($req->lignes as $ligne) {
            LigneCommande::create([
                'codekit' => $ligne['codekit'],
                'qte' => $ligne['qte'],
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
                $lignecmd = LigneCommande::where('codekit', $ligne['codekit'])
                ->where('commande_id', $commande->id)->first();
                $lignecmd->update(['qte' => $ligne['qte']]);
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
        return Commande::orderBy('created_at', 'desc')
            ->with('status', 'details')
            ->take(5)->get()->map->format();
    }

    public static function amount(){
        $commandes = Commande::where('created_at', '>',Carbon::now()->startOfYear())
        ->get()->map->format();
        $amount = 0;
        foreach($commandes as $commande){
            $amount += $commande['prix'];
        }
        return $amount;
    }
}
