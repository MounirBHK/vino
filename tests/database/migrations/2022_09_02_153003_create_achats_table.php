<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAchatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('achats', function (Blueprint $table) {
            $table->unsignedSmallInteger('id_utilisateur');
            $table->unsignedSmallInteger('id_bouteille');
            $table->dateTime('date_achat');
            $table->smallInteger('quantite_achat')->nullable();
            $table->decimal('prix_achat', 6, 2)->nullable();
            
            $table->primary(['id_utilisateur', 'id_bouteille', 'date_achat']);
            $table->foreign('id_bouteille', 'fk_achat')->references('id_bouteille')->on('bouteilles');
            $table->foreign('id_utilisateur', 'fk_achat2')->references('id_utilisateur')->on('utilisateurs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('achats');
    }
}
