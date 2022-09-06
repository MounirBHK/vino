<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUtilisateursTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('utilisateurs', function (Blueprint $table) {
            $table->smallIncrements('id_utilisateur')->unsigned()->primary();
            $table->string('courriel', 50);
            $table->string('nom', 25)->nullable();
            $table->string('prenom', 25)->nullable();
            $table->string('pswd', 50);
            $table->char('role', 5)->nullable();
            $table->timestamp('date_created')->useCurrent()->useCurrentOnUpdate();
            $table->timestamp('date_updated')->default('0000-00-00 00:00:00');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('utilisateurs');
    }
}
