<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests\Fabricant\CreateFabricantRequest;
use App\Http\Requests\Fabricant\UpdateFabricantRequest;
use App\Http\Requests\Fabricant\CodeFRequest;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Services\FabricantService;

class FabricantController extends Controller
{

    protected $fabricantService;

    public function __construct(FabricantService $fabricantService){
        $this->fabricantService = $fabricantService;
    }

    public function getAll(){
        $fabricants = $this->fabricantService::getAll();
        return Controller::responseJson(200, "Les fabricants ont été retournés", $fabricants);
    }

    public function paginate(){
        $fabricants = $this->fabricantService::paginate();
        return Controller::responseJson(200, "Les fabricants on été retournés", $fabricants);
    }


    public function find(CodeFRequest $req){
        $fabricant = $this->fabricantService::find($req);
        return Controller::responseJson(200, "Le fabricant a correctement été retourné", $fabricant);
    }




    public function delete(CodeFRequest $req){
        $this->fabricantService::delete($req);
        return Controller::responseJson(200, "Le fabricant demandé a été supprimé");
    }


    public function create(CreateFabricantRequest $req){
        try{
            $fabricant = $this->fabricantService::create($req);
        }catch(\Exception $e){
            return Controller::responseJson(422, "Une erreur est survenue lors de la création.");
        }
        return Controller::responseJson(200, "Le fabricant a correctement été crée", $fabricant);
    }


    public function update(UpdateFabricantRequest $req){
        try{
            $fabricant = $this->fabricantService::update($req);
        }catch(\Exception $e){
            return Controller::responseJson(422, "Une erreur est survenue lors de la mise à jour");
        }
        return Controller::responseJson(200, "Le fabricant a correctement été sauvegardé", $fabricant);
    }


    public function minimized(){
        $fabricants = $this->fabricantService::minimized();
        return Controller::responseJson(200, "Les fabricants ont été retourné", $fabricants);
    }


    public function filter(Request $req){
        $fabricants = $this->fabricantService::filter($req);
        return Controller::responseJson(200, "Les fabricants ont été retourné", $fabricants);
    }
}
