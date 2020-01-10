<?php

use Illuminate\Database\Seeder;

// composer require laracasts/testdummy
use Laracasts\TestDummy\Factory as TestDummy;
use App\Permission;

class PermissionTableSeeder extends Seeder
{
    public function run()
    {
        Permission::create([
            'libelle' => 'Voir tous les kits',
            'slug' => 'kits.view'
        ]);

        Permission::create([
            'libelle' => 'Voir tous les fabricants',
            'slug' => 'fabricants.view'
        ]);

        Permission::create([
            'libelle' => 'Voir toutes les commandes',
            'slug' => 'orders.view'
        ]);

        Permission::create([
            'libelle' => 'Réaliser une commande',
            'slug' => 'orders.create'
        ]);

        Permission::create([
            'libelle' => 'Mettre à jour une commande',
            'slug' => 'orders.update'
        ]);

        Permission::create([
            'libelle' => 'Voir tous les utilisateurs',
            'slug' => 'users.view'
        ]);

        Permission::create([
            'libelle' => 'Créer des utilisateurs',
            'slug' => 'users.create'
        ]);
    }
}
