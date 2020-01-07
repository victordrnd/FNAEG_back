<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\Commande\CreateCommandeRequest;
use App\Services\CommandeService;
use App\Http\Requests\Commande\UpdateCommandeRequest;   

class CommandeController extends Controller
{
    protected $commandeService;

    public function __construct(CommandeService $commandeService){
        $this->commandeService = $commandeService;
    }

    public function create(CreateCommandeRequest $req){
        try{
            $commande = $this->commandeService::create($req);
        }catch(\Exception $e){
            return Controller::responseJson(422, $e->getMessage());
        }
        return Controller::responseJson(200, "La commande a correctement été effectué", $commande);
    }


    public function getAll(){
        $commandes = $this->commandeService::getAll();
        return Controller::responseJson(200, "Les commandes ont été retournés", $commandes);
    }

    public function paginate(){
        $commandes = $this->commandeService::paginate();
        return Controller::responseJson(200, "Les commandes ont été retorunées", $commandes);
    }

    public function update(UpdateCommandeRequest $req){
        try{
            $commande = $this->commandeService::update($req);
        }catch(\Exception $e){
            return Controller::responseJson(422, "Une erreur est survenue lors de la mise à jour");
        }
        return Controller::responseJson(200, "La commande a correctement été mis à jour", $commande);
    }


    public function stats(){
        $commandes = $this->commandeService::stats();
        return Controller::responseJson(200, 'Les statistiques des commandes ont été retournés', $commandes);
    }
}
