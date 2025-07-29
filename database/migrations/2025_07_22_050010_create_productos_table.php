<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('productos', function (Blueprint $table) { // Crear la tabla productos
        $table->id(); // ID del producto, clave primaria
        $table->string('nombre');   // Nombre del producto
        $table->text('descripcion')->nullable();    // Descripción opcional
        $table->decimal('precio', 8, 2); // Precio con 8 dígitos en total y 2 decimales
        $table->unsignedBigInteger('categoria_id')->nullable(); // ID de la categoría, puede ser nulo
        $table->boolean('activo')->default(true); // Indica si el producto está activo, por defecto es true
        $table->timestamps(); // Timestamps para created_at y updated_at

        $table->foreign('categoria_id')->references('id')->on('categorias')->onDelete('set null'); // Clave foránea a la tabla categorias, al eliminar una categoría se pone a null
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
