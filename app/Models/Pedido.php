<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory; 
use App\Models\Producto;
use App\Models\User;
use App\Models\Mesa; // Asegúrate de que tienes el modelo Mesa
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;



class Pedido extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'user_id',
        'mesa_id',
        'estado',
        'total',
    ];

    public function productos()
    {
        return $this->belongsToMany(Producto::class, 'detalle_pedidos')
        ->withPivot('cantidad', 'precio_unitario')
        ->withTimestamps();
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function mesa()
    {
        return $this->belongsTo(Mesa::class);
    }

   
}
