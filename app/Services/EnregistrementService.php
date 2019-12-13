<?php

namespace App\Services;

use Illuminate\Http\Request;
use App\Enregistrement;
use Carbon\Carbon;

class EnregistrementService
{

    public static function update(Request $req){
        $enregistrement = Enregistrement::find($req->id);
        $enregistrement->update([
            'Stock' => $req->Stock
        ]);
        return $enregistrement;
        
    }


    public static function delete($id){
        Enregistrement::destroy($id);
    }





}
