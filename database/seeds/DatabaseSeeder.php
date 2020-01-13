<?php

use Illuminate\Database\Seeder;
use App\Status;
use App\Role;
use App\Permission;
use App\RolePermission;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Status::create([
        // 'libelle' => 'En attente'
        // ]);

        // Status::create([
        // 'libelle' => 'Validée'
        // ]);

        // Status::create([
        // 'libelle' => 'Annulée'
        // ]);
        //       Role::create([
        //       'libelle' => 'Inventoriste',
        //       'niveau' => 1
        //       ]);

        //       Role::create([
        //       'libelle' => "Opérateur d'approvisionnement",
        //       'niveau' => 2
        //       ]);

        //       Role::create([
        //       'libelle' => "Responsable",
        //       'niveau' => 3
        //       ]);



        //       Permission::create([
        //         'libelle' => 'Voir tous les kits',
        //         'slug' => 'kits.view'
        //       ]);

        //       Permission::create([
        //     'libelle' => 'Voir tous les fabricants',
        //     'slug' => 'fabricants.view'
        // ]);

        //       Permission::create([
        //     'libelle' => 'Voir toutes les commandes',
        //     'slug' => 'orders.view'
        // ]);

        //       Permission::create([
        //     'libelle' => 'Réaliser une commande',
        //     'slug' => 'orders.create'
        // ]);

        //       Permission::create([
        //     'libelle' => 'Mettre à jour une commande',
        //     'slug' => 'orders.update'
        // ]);

        //       Permission::create([
        //     'libelle' => 'Voir tous les utilisateurs',
        //     'slug' => 'users.view'
        // ]);

        //       Permission::create([
        //     'libelle' => 'Créer des utilisateurs',
        //     'slug' => 'users.create'
        // ]);
        // Permission::create([
        //   'libelle' => 'Voir tous les inventaires',
        //   'slug' => 'inventory.view'
        // ]);

        //Permission de l'inventoriste

        RolePermission::create([
            'role_id' => 1,
            'permission_id' => 1,
          ]);

        RolePermission::create([
            'role_id' => 1,
            'permission_id' => 2,
          ]);

        RolePermission::create([
            'role_id' => 1,
            'permission_id' => 8,
          ]);


          //Permissions de l'opérateur de stock
        RolePermission::create([
            'role_id' => 2,
            'permission_id' => 1,
          ]);

        RolePermission::create([
            'role_id' => 2,
            'permission_id' => 2,
          ]);

        RolePermission::create([
            'role_id' => 2,
            'permission_id' => 8,
          ]);

          RolePermission::create([
            'role_id' => 2,
            'permission_id' => 3,
          ]);

          RolePermission::create([
            'role_id' => 2,
            'permission_id' => 4,
          ]);

          RolePermission::create([
            'role_id' => 2,
            'permission_id' => 5,
          ]);


          //permission du responsable
          RolePermission::create([
            'role_id' => 3,
            'permission_id' => 1,
          ]);

        RolePermission::create([
            'role_id' => 3,
            'permission_id' => 2,
          ]);

        RolePermission::create([
            'role_id' => 3,
            'permission_id' => 8,
          ]);

          RolePermission::create([
            'role_id' => 3,
            'permission_id' => 3,
          ]);

          RolePermission::create([
            'role_id' => 3,
            'permission_id' => 4,
          ]);

          RolePermission::create([
            'role_id' => 3,
            'permission_id' => 5,
          ]);

          RolePermission::create([
            'role_id' => 3,
            'permission_id' => 6,
          ]);
          RolePermission::create([
            'role_id' => 3,
            'permission_id' => 7,
          ]);

    }
}
