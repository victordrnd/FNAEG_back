<?php

namespace App\Services;

use App\Kit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use App\Fabricant;
use Illuminate\Support\Facades\Storage;

class KitService
{
    public static function getAll()
    {
        return  Kit::with('fabricant')->get();
    }


    public static function paginate()
    {
        return Kit::with('fabricant')->paginate()->toArray();
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
            }
        }
        if ($req->has('fabricants') && !empty($req->fabricants)) {
            $kit->whereHas('fabricant', function ($query) use ($req) {
                $query->whereIn('codef', $req->fabricants);
            });
        }
        if ($req->has('ordersBy')) {
            foreach ($req->ordersBy as $item) {
                if (Schema::hasColumn('kits', $item['key'])) {
                    $kit->orderBy($item['key'], $item['value']);
                }
            }
        }
        return $kit->with('fabricant')->paginate()->toArray();
    }


    public static function find(Request $req)
    {
        return Kit::where('codekit', $req->codekit)->firstOrFail();
    }


    public static function update(Request $req)
    {
        $kit = Kit::where('codekit', $req->codekit)->firstOrFail();

        $kit->update($req->all());
        return $kit;
    }


    public static function create(Request $req)
    {
        return Kit::create([
            'codekit' => $req->codekit,
            'prix' => $req->prix,
            'duree' => $req->duree,
            'annee' => $req->annee,
            'stock' => 0,
            'codef' => $req->codef
        ]);
    }


    public static function delete(Request $req)
    {
        Kit::destroy($req->input('codekit'));
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
            $xml->writeAttribute('codekit', $kit->codekit);
            $xml->writeAttribute('prix', $kit->prix);
            $xml->writeAttribute('annee', $kit->annee);
            $xml->writeAttribute('duree', $kit->duree);
            $xml->writeAttribute('stock', $kit->stock);
            $xml->writeAttribute('fabricant', $kit->codef);
            $xml->endElement();
        }
        $xml->endElement();
        $xml->endDocument();
        $contents = $xml->outputMemory();
        $link = 'kits.xml';
        Storage::disk('public')->put($link, $contents);
        return Storage::disk('public')->path($link);;
    }


    public static function import(Request $req)
    {
        $xmlFile = $req->file('file');
        $xmlContent = file_get_contents($xmlFile);
        $xml = simplexml_load_string($xmlContent);
        foreach ($xml->Kit as $kitNode) {
            $kit = Kit::where('codekit', (string) $kitNode['codekit'])->firstOrFail();
            $kit->update([
                'stock' => (integer) $kitNode['stock']
            ]);
        }
    }



}
