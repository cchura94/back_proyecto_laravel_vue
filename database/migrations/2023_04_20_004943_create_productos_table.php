<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string("nombre", 200);
            $table->decimal("precio", 10, 2);
            $table->integer("cantidad")->default(0);
            $table->string("imagen");
            $table->text("descripcion")->nullable();
            // N:1
            $table->bigInteger("categoria_id")->unsigned();
            $table->foreign("categoria_id")->references("id")->on("categorias");

            $table->softDeletes(); // deleted_at
            $table->timestamps(); // created_at, updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
