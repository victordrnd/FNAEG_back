<?php

use Illuminate\Database\Seeder;

// composer require laracasts/testdummy
use Laracasts\TestDummy\Factory as TestDummy;
use App\Status;

class StatusSeeder extends Seeder
{
    public function run()
    {
        Status::create([
            'libelle' => 'En attente' 
        ]);

        Status::create([
            'libelle' => 'Validée' 
        ]);

        Status::create([
            'libelle' => 'Annulée' 
        ]);
        // TestDummy::times(20)->create('App\Post');
    }
}
