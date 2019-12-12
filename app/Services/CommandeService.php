<?php

namespace App\Services;

use Illuminate\Http\Request;
use App\Commande;
use App\Laboratoire;
use Carbon\Carbon;

class CommandeService
{
    public static function create(Request $req)
    {
        return Commande::create([
            'CodeKit' => $req->CodeKit,
            'CodeLab' => $req->CodeLab,
            'DateCde' => Carbon::now()->toDateTimeString(),
            'Qte' => $req->Qte
        ]); 
    }


}
