<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConsommationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('consommations', function (Blueprint $table) {
            $table->unsignedSmallInteger('id_utilisateur');
            $table->unsignedSmallInteger('id_bouteille');
            $table->dateTime('date_consommation');
            $table->smallInteger('quantite_cons')->nullable();
            
            $table->primary(['id_utilisateur', 'id_bouteille', 'date_consommation']);
            $table->foreign('id_bouteille', 'fk_consommation')->references('id_bouteille')->on('bouteilles');
            $table->foreign('id_utilisateur', 'fk_consommation2')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('consommations');
    }
}
