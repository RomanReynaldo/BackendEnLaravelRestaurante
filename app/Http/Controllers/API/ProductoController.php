<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage; // Para manejar las imágenes

class ProductoController extends Controller
{
    public function __construct()
    {
       // ¡¡¡IMPORTANTE: ESTA SECCIÓN DEBE ESTAR COMENTADA O ELIMINADA EN ESTA OPCIÓN!!!
       // La lógica de roles se maneja directamente en routes/api.php
       // $this->middleware('role:admin|mesero')->only(['store', 'update', 'destroy']);
       // $this->middleware('role:admin|mesero|comensal')->only(['index', 'show']);
    }

    /**
     * Muestra una lista de todos los productos.
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $productos = Producto::all();

        // Mapear los productos para añadir la URL de la imagen
        $formattedProducts = $productos->map(function ($producto) {
            return [
                'id' => $producto->id,
                'nombre' => $producto->nombre,
                'descripcion' => $producto->descripcion,
                'imagen_url' => $producto->imagen ? Storage::url($producto->imagen) : null, // Construye la URL aquí
                'precio' => $producto->precio,
                'categoria_id' => $producto->categoria_id,
                'activo' => (bool) $producto->activo,
                'created_at' => $producto->created_at,
                'updated_at' => $producto->updated_at,
            ];
        });

        return response()->json($formattedProducts);
    }

    /**
     * Almacena un nuevo producto en la base de datos.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|string|max:255',
            'precio' => 'required|numeric',
            'descripcion' => 'nullable|string',
            'imagen' => 'nullable|image|max:2048',
        ]);

        $imagePath = null;
        if ($request->hasFile('imagen')) {
            $imagePath = $request->file('imagen')->store('productos', 'public');
            $validated['imagen'] = $imagePath;
        }

        $producto = Producto::create($validated);

        // Retorna el producto con la URL de la imagen completa
        
        return response()->json([
            'message' => 'Producto creado exitosamente',
            'producto' => [
                'id' => $producto->id,
                'nombre' => $producto->nombre,
                'descripcion' => $producto->descripcion,
                'imagen_url' => $producto->imagen ? Storage::url($producto->imagen) : null, // Construye la URL aquí
                'precio' => $producto->precio,
                'categoria_id' => $producto->categoria_id,
                'activo' => (bool) $producto->activo,
                'created_at' => $producto->created_at,
                'updated_at' => $producto->updated_at,
            ]
        ], 201);
    }

    /**
     * Muestra un producto específico.
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $producto = Producto::find($id);

        if (! $producto) {
            return response()->json(['message' => 'Producto no encontrado'], 404);
        }

        // Retorna el producto con la URL de la imagen completa
        return response()->json([
            'id' => $producto->id,
            'nombre' => $producto->nombre,
            'descripcion' => $producto->descripcion,
            'imagen_url' => $producto->imagen ? Storage::url($producto->imagen) : null, // Construye la URL aquí
            'precio' => $producto->precio,
            'categoria_id' => $producto->categoria_id,
            'activo' => (bool) $producto->activo,
            'created_at' => $producto->created_at,
            'updated_at' => $producto->updated_at,
        ]);
    }

    /**
     * Actualiza un producto existente.
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $producto = Producto::find($id);

        if (! $producto) {
            return response()->json(['message' => 'Producto no encontrado'], 404);
        }

        $validated = $request->validate([
            'nombre' => 'sometimes|required|string|max:255',
            'precio' => 'sometimes|required|numeric',
            'descripcion' => 'nullable|string',
            'imagen' => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('imagen')) {
            if ($producto->imagen && Storage::disk('public')->exists($producto->imagen)) {
                Storage::disk('public')->delete($producto->imagen);
            }
            $imagePath = $request->file('imagen')->store('productos', 'public');
            $validated['imagen'] = $imagePath;
        }

        $producto->update($validated);

        // Retorna el producto con la URL de la imagen completa
        return response()->json([
            'message' => 'Producto actualizado exitosamente',
            'producto' => [
                'id' => $producto->id,
                'nombre' => $producto->nombre,
                'descripcion' => $producto->descripcion,
                'imagen_url' => $producto->imagen ? Storage::url($producto->imagen) : null, // Construye la URL aquí
                'precio' => $producto->precio,
                'categoria_id' => $producto->categoria_id,
                'activo' => (bool) $producto->activo,
                'created_at' => $producto->created_at,
                'updated_at' => $producto->updated_at,
            ]
        ]);
    }

    /**
     * Elimina un producto.
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $producto = Producto::find($id);

        if (! $producto) {
            return response()->json(['message' => 'Producto no encontrado'], 404);
        }

        if ($producto->imagen && Storage::disk('public')->exists($producto->imagen)) {
            Storage::disk('public')->delete($producto->imagen);
        }

        $producto->delete();

        return response()->json(['message' => 'Producto eliminado exitosamente']);
    }
}