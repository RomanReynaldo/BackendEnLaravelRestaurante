<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Mesa; // Importa el modelo Mesa
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Log; // Para loguear errores

class MesaController extends Controller
{
    /**
     * Muestra una lista de todas las mesas.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $mesas = Mesa::all();
        return response()->json($mesas);
    }

    /**
     * Almacena una nueva mesa en la base de datos.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'nombre' => 'required|string|max:255|unique:mesas,nombre',
                'estado' => 'required|in:disponible,ocupada,no disponible', // Define los estados permitidos
            ]);

            $mesa = Mesa::create($request->all());

            return response()->json([
                'message' => 'Mesa creada con éxito.',
                'mesa' => $mesa
            ], 201);

        } catch (ValidationException $e) {
            Log::error('Error de validación al crear mesa.', ['errors' => $e->errors(), 'request_data' => $request->all()]);
            return response()->json(['message' => 'Error de validación.', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            Log::error('Error interno del servidor al crear mesa.', [
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
     * Muestra los detalles de una mesa específica.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $mesa = Mesa::find($id);

        if (!$mesa) {
            return response()->json(['message' => 'Mesa no encontrada.'], 404);
        }

        return response()->json($mesa);
    }

    /**
     * Actualiza una mesa existente en la base de datos.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $mesa = Mesa::find($id);

        if (!$mesa) {
            return response()->json(['message' => 'Mesa no encontrada.'], 404);
        }

        try {
            $request->validate([
                'nombre' => 'sometimes|required|string|max:255|unique:mesas,nombre,' . $id, // Ignora el ID actual para unique
                'estado' => 'sometimes|required|in:disponible,ocupada,no disponible' // Define los estados permitidos
            ]);

            $mesa->update($request->all());

            return response()->json([
                'message' => 'Mesa actualizada con éxito.',
                'mesa' => $mesa
            ], 200);

        } catch (ValidationException $e) {
            Log::error('Error de validación al actualizar mesa.', ['errors' => $e->errors(), 'request_data' => $request->all()]);
            return response()->json(['message' => 'Error de validación.', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            Log::error('Error interno del servidor al actualizar mesa.', [
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
     * Elimina una mesa de la base de datos.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $mesa = Mesa::find($id);

        if (!$mesa) {
            return response()->json(['message' => 'Mesa no encontrada.'], 404);
        }

        // Considera si realmente quieres eliminar mesas o solo "desactivarlas"
        // Si una mesa tiene pedidos asociados, la eliminación podría fallar
        // debido a restricciones de clave externa.
        // Una opción es cambiar su estado a 'inactiva' en lugar de borrarla.
        $mesa->update(['estado' => 'no disponible']); // Cambia el estado a inactiva
        //$mesa->delete();

        return response()->json(['message' => 'Mesa eliminada con éxito.'], 200);
    }
}