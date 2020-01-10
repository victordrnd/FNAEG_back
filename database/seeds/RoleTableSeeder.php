<?php

use Illuminate\Database\Seeder;

// composer require laracasts/testdummy
use Laracasts\TestDummy\Factory as TestDummy;
use App\Role;
class RoleTableSeeder extends Seeder
{
    public function run()
    {
        Role::create([
            'libelle' => 'Inventoriste',
            'niveau' => 1 
        ]);

        Role::create([
            'libelle' => "Opérateur d'approvisionnement",
            'niveau' => 2 
        ]);

        Role::create([
            'libelle' => "Responsable",
            'niveau' => 3 
        ]);

    }
}
