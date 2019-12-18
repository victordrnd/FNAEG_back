<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEnregistrementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('enregistrements', function (Blueprint $table) {
        //     $table->increments('id');
        //     $table->integer('inventaire_id')->unsigned()->index();
        //     $table->string('CodeKit', 30);
        //     $table->integer('Stock')->nullable();
        //     $table->foreign('inventaire_id')->references('id')->on('inventaires');
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('enregistrements');
    }
}
