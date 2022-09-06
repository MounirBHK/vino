<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBouteillesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bouteilles', function (Blueprint $table) {
            $table->smallIncrements('id_bouteille')->unsigned()->primary();
            $table->unsignedSmallInteger('id_type');
            $table->string('nom_bouteille');
            $table->string('image')->nullable();
            $table->string('code_saq', 25)->nullable();
            $table->string('pays', 25)->nullable();
            $table->string('description')->nullable();
            $table->decimal('prix_saq', 6, 2)->nullable();
            $table->string('url_saq')->nullable();
            $table->string('url_img')->nullable();
            $table->string('format', 20)->nullable();
            $table->smallInteger('degre_alcool')->nullable();
            $table->string('producteur')->nullable();
            $table->string('region')->nullable();
            $table->integer('millesime')->nullable();
            
            $table->foreign('id_type', 'fk_appartenir')->references('id_type')->on('types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bouteilles');
    }
}
