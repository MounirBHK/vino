<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCelliersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('celliers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_user');
            $table->string('lib_cellier', 20)->nullable();
            $table->smallInteger('nbr_colonne')->nullable();
            $table->smallInteger('nbr_ligne')->nullable();
            $table->integer('capacite')->nullable();
            $table->timestamps();
            
            $table->foreign('id_user', 'fk_avoir')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('celliers');
    }
}
