<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Categoria; // Importa el modelo Categoria
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Log; // Para loguear errores

class CategoriaController extends Controller
{
    /**
     * Muestra una lista de todas las categorías.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $categorias = Categoria::all();
        return response()->json($categorias);
    }

    /**
     * Almacena una nueva categoría en la base de datos.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'nombre' => 'required|string|max:255|unique:categorias,nombre',
                'descripcion' => 'nullable|string|max:500',
            ]);

            $categoria = Categoria::create($request->all());

            return response()->json([
                'message' => 'Categoría creada con éxito.',
                'categoria' => $categoria
            ], 201);

        } catch (ValidationException $e) {
            Log::error('Error de validación al crear categoría.', ['errors' => $e->errors(), 'request_data' => $request->all()]);
            return response()->json(['message' => 'Error de validación.', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            Log::error('Error interno del servidor al crear categoría.', [
                'error_message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString(),
                'request_data' => $request->all()
            ]);
            return response()->json(['message' => 'Error interno del servidor.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Muestra los detalles de una categoría específica.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $categoria = Categoria::find($id);

        if (!$categoria) {
            return response()->json(['message' => 'Categoría no encontrada.'], 404);
        }

        return response()->json($categoria);
    }

    /**
     * Actualiza una categoría existente en la base de datos.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $categoria = Categoria::find($id);

        if (!$categoria) {
            return response()->json(['message' => 'Categoría no encontrada.'], 404);
        }

        try {
            $request->validate([
                'nombre' => 'required|string|max:255|unique:categorias,nombre,' . $id, // Ignora el ID actual para unique
                'descripcion' => 'nullable|string|max:500',
            ]);

            $categoria->update($request->all());

            return response()->json([
                'message' => 'Categoría actualizada con éxito.',
                'categoria' => $categoria
            ], 200);

        } catch (ValidationException $e) {
            Log::error('Error de validación al actualizar categoría.', ['errors' => $e->errors(), 'request_data' => $request->all()]);
            return response()->json(['message' => 'Error de validación.', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            Log::error('Error interno del servidor al actualizar categoría.', [
                'error_message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString(),
                'request_data' => $request->all()
            ]);
            return response()->json(['message' => 'Error interno del servidor.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Elimina una categoría de la base de datos.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $categoria = Categoria::find($id);

        if (!$categoria) {
            return response()->json(['message' => 'Categoría no encontrada.'], 404);
        }

        // Considera si realmente quieres eliminar categorías o solo "desactivarlas"
        // Si una categoría tiene productos asociados, la eliminación podría fallar
        // debido a restricciones de clave externa, o dejar productos sin categoría.
        // Una opción es marcarla como 'inactiva' si tienes un campo de estado.
        $categoria->delete();

        return response()->json(['message' => 'Categoría eliminada con éxito.'], 200);
    }
}