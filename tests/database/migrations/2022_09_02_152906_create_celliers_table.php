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
            $table->smallIncrements('id_cellier')->unsigned()->primary();
            $table->unsignedSmallInteger('id_utilisateur');
            $table->string('lib_cellier', 20)->nullable();
            $table->smallInteger('nbr_colonne')->nullable();
            $table->smallInteger('nbr_ligne')->nullable();
            $table->integer('capacite')->nullable();
            
            $table->foreign('id_utilisateur', 'fk_avoir')->references('id_utilisateur')->on('utilisateurs');
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
