<?php

namespace App\Services;

use App\Kit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class KitService
{
    public static function getAll()
    {
        return  Kit::where('CodeKit', '!=', null)->with('fabricant')->get();
    }


    public static function paginate()
    {
        return Kit::where('CodeKit', '!=', null)->with('fabricant')->paginate()->toArray();
    }


    public static function filter(Request $req)
    {
        $kit = (new Kit)->newQuery();

        if ($req->has('min')) {
            $kit->where('prix', '>=', $req->min);
        }
        if ($req->has('max')) {
            $kit->where('prix', '<=', $req->max);
        }

        if ($req->has('stock')) {
            if ($req->stock) {
                $kit->where('stock', '>', 0);
            } else {
                $kit->where('stock', 0);
            }
        }
        if ($req->has('fabricants')) {
            $kit->whereHas('fabricants', function ($query) use ($req) {
                $query->whereIn('fabricants.CodeF', $req->input('fabricants'));
            });
        }
        if ($req->has('orderBy')) {
            foreach ($req->orderBy as $column) {
                if (Schema::hasColumn('kits', $column)) {
                    $kit->orderBy($column, 'DESC');
                }
            }
        }
        return $kit->with('fabricant')->paginate()->toArray();
    }


    public static function find(Request $req)
    {
        return Kit::where('CodeKit', $req->CodeKit)->firstOrFail();
    }


    public static function update(Request $req)
    {
        $kit = Kit::where('CodeKit', $req->CodeKit)->firstOrFail();

        $kit->update($req->all());
        return $kit;
    }


    public static function create(Request $req)
    {
        return Kit::create([
            'CodeKit' => $req->CodeKit,
            'prix' => $req->prix,
            'Duree' => $req->Duree,
            'Annee' => $req->Annee,
            'Stock' => 0,
            'CodeF' => $req->CodeF
        ]);
    }


    public static function delete(Request $req)
    {
        Kit::destroy($req->input('CodeKit'));
    }


    public static function export()
    {
        $kits = Kit::all();
        $xml = new \XMLWriter();
        $xml->openMemory();
        $xml->setIndent(true);
        $xml->startDocument();
        $xml->startElement('Kits');
        foreach ($kits as $kit) {
            $xml->startElement('Kit');
            $xml->writeAttribute('CodeKit', $kit->CodeKit);
            $xml->writeAttribute('Prix', $kit->prix);
            $xml->writeAttribute('Annee', $kit->Annee);
            $xml->writeAttribute('Duree', $kit->Duree);
            $xml->writeAttribute('Stock', $kit->Stock);
            $xml->writeAttribute('Fabricant', $kit->CodeF);
            $xml->endElement();
        }
        $xml->endElement();
        $xml->endDocument();
        $contents = $xml->outputMemory();
        return $contents;
    }


    public static function import(Request $req)
    {
        $xmlFile = $req->file('stock');
        $xmlContent = file_get_contents($xmlFile);
        $xml = simplexml_load_string($xmlContent);
        foreach ($xml->Kit as $kitNode) {
            $kit = Kit::where('CodeKit', (string) $kitNode['CodeKit'])->firstOrFail();
            $kit->update([
                'Stock' => (integer) $kitNode['Stock']
            ]);
        }
    }



}
