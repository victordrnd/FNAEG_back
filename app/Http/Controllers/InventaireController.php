<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Inventaire;
use App\Enregistrement;
use App\Http\Requests\Inventaire\CreateInventaireRequest;
use App\Services\InventaireService;

class InventaireController extends Controller
{
    protected $inventaireService;

    public function __construct(InventaireService $inventaireService){
        $this->inventaireService = $inventaireService;
    }

    public function create(CreateInventaireRequest $req){
        $inventaire = $this->inventaireService::create($req);
        return Controller::responseJson(200, "L'inventaire a correctement été crée", $inventaire); 
    }


    public function getAll(){
        $inventaires =$this->inventaireService::getAll();
        return Controller::responseJson(200, 'Les inventaires ont été retournés', $inventaires);
    }


    public function delete($id){
        $this->inventaireService::delete($id);
        return Controller::responseJson(200, "L'inventaire a correctement été supprimé");
    }



}
