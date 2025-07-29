<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Producto>
 */
class ProductoFactory extends Factory
{


    protected $model = \App\Models\Producto::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        
             return [
            'nombre' => $this->faker->word(),
            'descripcion' => $this->faker->sentence(),
            'precio' => $this->faker->randomFloat(2, 10, 100),
            'categoria_id' => rand(1, 3), // Asegúrate que existan estas categorías
            'activo' => $this->faker->boolean(80), // 80% chance true
        
        ];
    }
}
