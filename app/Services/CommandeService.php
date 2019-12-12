<?php

namespace App\Services;

use Illuminate\Http\Request;
use App\Commande;
use App\Laboratoire;
use Carbon\Carbon;

class CommandeService
{
    public static function getAll(){
        return Commande::all();
    }


    public static function create(Request $req)
    {
        return Commande::create([
            'CodeKit' => $req->CodeKit,
            'CodeLab' => $req->CodeLab,
            'DateCde' => Carbon::now()->toDateTimeString(),
            'Qte' => $req->Qte
        ]); 
    }

    public static function update(Request $req){
        $commande = Commande::where('CodeKit', $req->CodeKit)
                    ->where('CodeLab', 'FNAEG')
                    ->where('DateCde', 'DateCde')
                    ->firstOrFail();

        $commande->update([
            'Qte' => $req->Qte
        ]);
        return $commande;

    }   





}
