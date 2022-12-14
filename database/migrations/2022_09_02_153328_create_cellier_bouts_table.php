<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCellierBoutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cellier_bouts', function (Blueprint $table) {
            $table->unsignedBigInteger('id_cellier');
            $table->unsignedBigInteger('id_bouteille');
            $table->smallInteger('quantite')->nullable();
            $table->date('derniere_trans')->nullable();
            $table->timestamps();
            
            $table->primary(['id_cellier', 'id_bouteille']);
            $table->foreign('id_bouteille', 'fk_cellier_bout')->references('id')->on('bouteilles');
            $table->foreign('id_cellier', 'fk_cellier_bout2')->references('id')->on('celliers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cellier_bouts');
    }
}
