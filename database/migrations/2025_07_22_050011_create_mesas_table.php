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
    Schema::create('mesas', function (Blueprint $table) {
        $table->id();
        $table->string('nombre'); // Ej: Mesa 1, Mesa VIP
        $table->enum('estado', ['disponible', 'ocupada', 'no disponible'])->default('disponible'); // Estado de la mesa: disponible, ocupada o no disponible
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mesas');
    }
};
