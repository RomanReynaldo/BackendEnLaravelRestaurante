<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory; // Asumiendo que quieres usar factories

class DetallePedido extends Model
{
    use HasFactory;

    // protected $table = 'detalle_pedidos';

    protected $fillable = [
        'pedido_id',
        'producto_id',
        'cantidad',
        'precio_unitario', // Este campo ya está en la migración 
    ];

    /**
     * Define la relación con el Pedido al que pertenece este detalle.
     */
    public function pedido()
    {
        return $this->belongsTo(Pedido::class);
    }

    /**
     * Define la relación con el Producto que representa este detalle.
     */
    public function producto()
    {
        return $this->belongsTo(Producto::class);
    }
}