<?php

use Illuminate\Database\Seeder;
use App\Status;
class DatabaseSeeder extends Seeder
{
  /**
   * Run the database seeds.
   *
   * @return void
   */
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
    // $this->call([
    //   StatusSeeder::class
    // ]);
  }
}
