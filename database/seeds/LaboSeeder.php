<?php

use Illuminate\Database\Seeder;

// composer require laracasts/testdummy
use Laracasts\TestDummy\Factory as TestDummy;
use App\Laboratoire;

class LaboSeederTableSeeder extends Seeder
{
    public function run()
    {
        Laboratoire::create([
            'CodeLab' => 'FNAEG',
            'Type' => 'Scientifique',
            'Ville' => 'Lyon'
        ]);
    }
}
