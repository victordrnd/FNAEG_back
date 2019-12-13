<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Enregistrement;
use App\Services\EnregistrementService;
class EnregistrementController extends Controller
{
    protected $enregistrementService;
    public function __construct(EnregistrementService $enregistrementService){
        $this->enregistrementService = $enregistrementService;
    }

    public function update(Request $req){
        try{
            $enregistrement = $this->enregistrementService::update($req);
        }catch(\Exception $e){
            return Controller::responseJson(422, "Une erreur est survenue.");
        }
        return Controller::responseJson(200, "L'enregistrement a correctement été mis à jour", $enregistrement);
    }

    public function delete(Request $req){
        $this->enregistrementService::delete($req->id);
        return Controller::responseJson(200, "L'enregistrement a été supprimé");
    }


}
