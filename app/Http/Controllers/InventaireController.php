<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Inventaire;
use App\Enregistrement;
use App\Http\Requests\Inventaire\CreateInventaireRequest;
use App\Services\InventaireService;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Requests\Inventaire\FindInventaireRequest;
use App\Http\Requests\Inventaire\FilterInventaireRequest;

class InventaireController extends Controller
{
    protected $inventaireService;

    public function __construct(InventaireService $inventaireService){
        $this->inventaireService = $inventaireService;
    }

    public function find(FindInventaireRequest $req){
        try{
            $inventaire = $this->inventaireService::find($req->id);
        }catch(ModelNotFoundException $e){
            return Controller::responseJson(404, "L'inventaire demandé n'existe pas");
        }
        return Controller::responseJson(200, "L'inventaire a été retourné", $inventaire);
    }

    public function create(CreateInventaireRequest $req){
        $inventaire = $this->inventaireService::create($req);
        return Controller::responseJson(200, "L'inventaire a correctement été crée", $inventaire); 
    }


    public function getAll(){
        $inventaires = $this->inventaireService::getAll();
        return Controller::responseJson(200, 'Les inventaires ont été retournés', $inventaires);
    }

    public function paginate(){
        $inventaires = $this->inventaireService::paginate();
        return Controller::responseJson(200, "Les inventaires ont été retournés", $inventaires);
    }


    public function delete($id){
        $this->inventaireService::delete($id);
        return Controller::responseJson(200, "L'inventaire a correctement été supprimé");
    }

    public function filter(FilterInventaireRequest $req){
        $inventaires = $this->inventaireService::filter($req);
        return Controller::responseJson(200, "Les inventaires ont été filtré", $inventaires);
    }

    public function stats(){
        $inventaires = $this->inventaireService::stats();
        return Controller::responseJson(200, "Les inventaires ont été renvoyé", $inventaires);
    }

    public function graphs(){
        $inventaires = $this->inventaireService::graphs();
        return Controller::responseJson(200, "Les inventaires ont été retourné", $inventaires);
    }

}
