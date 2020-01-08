<?php

namespace App\Services;

use App\Inventaire;
use App\Enregistrement;
use App\Kit;
use Illuminate\Http\Request;
use Carbon\Carbon;

class InventaireService
{
    public static function getAll()
    {
        return Inventaire::orderBy('created_at', 'DESC')
            ->with('enregistrements')
            ->get()
            ->map->format();
    }

    public static function paginate()
    {
        return Inventaire::orderBy('created_at', 'DESC')
            ->with('enregistrements', 'enregistrements.kit', 'enregistrements.kit.fabricant')
            ->paginate(5)->toArray();
    }


    public static function create(Request $req)
    {
        $inventaire = Inventaire::create();
        foreach ($req->kits as $kit) {
            Kit::find($kit['CodeKit'])->update([
                'Stock' => $kit['Stock']
            ]);
            Enregistrement::create([
                'inventaire_id' => $inventaire->id,
                'CodeKit' => $kit['CodeKit'],
                'Stock' => $kit['Stock']
            ]);
        }
        return self::find($inventaire->id);
    }

    public static function find($id)
    {
        return Inventaire::where('id', $id)->with('enregistrements')->firstOrFail();
    }


    public static function delete($id)
    {
        Enregistrement::where('inventaire_id', $id)->delete();
        Inventaire::destroy($id);
    }

    public static function filter(Request $req)
    {
        $inventaires = (new Inventaire)->newQuery();

        if ($req->has('dateRange')) {
            if (!empty($req->dateRange)) {
                $inventaires->whereBetween('created_at', $req->dateRange);
            }
        }
        return $inventaires->orderBy('created_at', 'DESC')
            ->with('enregistrements', 'enregistrements.kit', 'enregistrements.kit.fabricant')
            ->paginate(100)->toArray();
    }


    public static function stats()
    {
        return Inventaire::orderBy('created_at', 'desc')
            ->take(5)->get()->map->format();
    }

    public static function last(){
        return Inventaire::orderBy('created_at', 'DESC')->first()->format();
    }

    public static function graphs()
    {
        $months = Inventaire::where('created_at', '>', Carbon::now()->subMonth(6))
        ->get()
        ->groupBy(function ($d) {
            return Carbon::parse($d->created_at)->format('F');
        });
        

        $stockCount = [];
        $result = [];

        foreach ($months as $key => $inventaires) {
            $inventaire = $inventaires->last();
            $sum = $inventaire->enregistrements->sum(function($record){
                return $record->Stock;
            });
            $stockCount[$key] = $sum;
        }

        return $stockCount;
    }
}
