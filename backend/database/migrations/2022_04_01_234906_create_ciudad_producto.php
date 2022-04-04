<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCiudadProducto extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ciudad_producto', function (Blueprint $table) {
            $table->integer('producto_id')->unsigned();

            $table->integer('ciudad_id')->unsigned();
        
            $table->foreign('producto_id')->references('id')->on('productos')
        
                ->onDelete('cascade');
        
            $table->foreign('ciudad_id')->references('id')->on('ciudades')
        
                ->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ciudad_producto');
    }
}
