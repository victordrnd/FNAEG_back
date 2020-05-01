<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\Kit\CreateKitRequest;
use App\Http\Requests\Kit\CodeKitRequest;
use App\Http\Requests\Kit\ImportKitRequest;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Requests\Kit\UpdateKitRequest;
use Illuminate\Support\Facades\Response;
use App\Http\Requests\Kit\SearchKitRequest;
use App\Services\KitService;

class KitController extends Controller{
    protected $kitService;

    public function __construct(KitService $kitService){
        $this->kitService = $kitService;
    }


    public function getAll()
    {
        $kits = $this->kitService::getAll();
        return Controller::responseJson(200, "Les kits ont été retournés", $kits);
    }



    public function getAllWithPagination()
    {
        $kits = $this->kitService::paginate();
        return Controller::responseJson(200, "Les kits ont été retournés", $kits);
    }




    public function filter(SearchKitRequest $req)
    {
        $kits = $this->kitService::filter($req);
        return Controller::responseJson(200, "Les kits ont été filtré", $kits);
    }




    public function find(CodeKitRequest $req)
    {
        try {
            $kit = $this->kitService::find($req);
        } catch (ModelNotFoundException $e) {
            return Controller::responseJson(404, "Le kit demandé n'existe pas");
        }
        return Controller::responseJson(200, "Succes", $kit);
    }




    public function update(UpdateKitRequest $req)
    {
        try {
            $kit = $this->kitService::update($req);
        } catch (ModelNotFoundException $e) {
            return Controller::responseJson(422, "Une erreur est survenue lors de la mise à jour");
        }
        return Controller::responseJson(200, "Le kit a correctement été mis à jour", $kit);
    }


    public function create(CreateKitRequest $req)
    {
        try {
            $kit = $this->kitService::create($req);
        } catch (\Exception $e) {
            return Controller::responseJson(422, "Une erreur est survenue lors de la création.");
        }
        return Controller::responseJson(200, "Le kit a correctement été crée", $kit);
    }


    public function delete(CodeKitRequest $req)
    {
        $this->kitService::delete($req);
        return Controller::responseJson(200, "Les kits demandé ont été supprimé");
    }


    public function export()
    {
        $file = $this->kitService::export();
        return response()->download($file);
    }


    public function import(ImportKitRequest $req){
       $this->kitService::import($req);
       $kits = $this->kitService::paginate();
        return Controller::responseJson(200 ,"Les kits ont été mis à jour", $kits);
    }


    public function count(){
        $count = \App\Kit::all()->sum(function($kit){
            return $kit->stock;
        });
        $amount = \App\Kit::all()->sum(function($kit){
            return $kit->stock * $kit->prix;
        }); 
        return Controller::responseJson(200, "Le count a été retourné", ['count'=>$count, 'amount' => $amount]);
    }
}
