<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mesa extends Model
{
    protected $table = 'mesas';

    protected $fillable = [
        'numero',
        'capacidad',
        'estado',
    ];

    public function reservas()
    {
        return $this->hasMany(Reserva::class);
    }

    public function scopeDisponibles($query)
    {
        return $query->where('estado', 'disponible');
    }
}
