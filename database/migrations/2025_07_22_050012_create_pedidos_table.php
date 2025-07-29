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
    Schema::create('pedidos', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('user_id')->nullable(); // Cliente (comensal o mesero que lo toma)
        $table->unsignedBigInteger('mesa_id')->nullable();
        $table->decimal('total', 8, 2)->default(0);
        $table->enum('estado', ['pendiente', 'en preparación', 'listo', 'entregado','pagado', 'cancelado'])->default('pendiente');
        $table->timestamps();

        $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
        $table->foreign('mesa_id')->references('id')->on('mesas')->onDelete('set null');
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pedidos');
    }
};
