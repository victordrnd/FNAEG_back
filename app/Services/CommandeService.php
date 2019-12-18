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
        return Commande::with('status', 'kits')->get();
    }


    public static function find($id){
        return Commande::where('id', $id)->with('status', 'kits')->first();
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
    }
}
