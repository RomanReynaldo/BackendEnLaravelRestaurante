<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Categoria; 

class CategoriasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        
        Categoria::create(['nombre' => 'Comida']);
        Categoria::create(['nombre' => 'Bebidas']);
        Categoria::create(['nombre' => 'Postres']);
        Categoria::create(['nombre' => 'Entradas']);
        Categoria::create(['nombre' => 'Especiales']);
    }
}
