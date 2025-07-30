<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Models\Pedido;
use App\Models\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Barryvdh\DomPDF\Facade\Pdf; // Asegúrate de que DomPDF esté instalado y configurado correctamente
use App\Mail\TicketPagoMail; // Asegúrate de que esta clase exista y esté configurada correctamente
use Illuminate\Support\Facades\Storage;// Asegúrate de que el sistema de archivos esté configurado correctamente
use Illuminate\Support\Facades\Log;

use Illuminate\Validation\ValidationException;

class PedidoController extends Controller
{
    /**
     * Muestra una lista de todos los pedidos.
     * Incluye los detalles de los productos asociados para cada pedido.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        // Carga los pedidos incluyendo la información del usuario, la mesa y los productos con sus pivotes.
        //$pedidos = Pedido::with('user', 'mesa', 'productos')->get();
        $pedido = Pedido::all();

        return response()->json($pedido);
    }

    /**
     * Muestra los detalles de un pedido específico.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        // Busca el pedido por ID y carga sus relaciones.
        $pedido = Pedido::find($id);
        //$pedido = Pedido::with('user', 'mesa', 'productos')->find($id);

        if (!$pedido) {
            return response()->json(['message' => 'Pedido no encontrado.'], 404);
        }

        return response()->json($pedido);
    }

    /**
     * Crea un nuevo pedido con múltiples productos.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        \Log::info('Inicio de la petición STORE de Pedido.', ['request_data' => $request->all()]);

        try {
            $request->validate([
                'mesa_id' => 'nullable|exists:mesas,id',
                'items' => 'required|array|min:1',
                'items.*.producto_id' => 'required|exists:productos,id',
                'items.*.cantidad' => 'required|integer|min:1',
            ]);

            \Log::info('Validación del pedido exitosa.');
            $totalGeneral = 0; // Inicializa el total del pedido

            DB::beginTransaction();

            $pedido = Pedido::create([
                'user_id' => auth()->id(),
                'mesa_id' => $request->input('mesa_id'),
                'estado' => 'pendiente',
                'total' => 0,
            ]);
            \Log::info('Pedido principal creado.', ['pedido_id' => $pedido->id]);

            $productsToAttach = [];

            foreach ($request->input('items') as $itemData) {
                $producto = Producto::find($itemData['producto_id']);

                // La validación 'exists:productos,id' ya debería haber prevenido esto.
                // Si llegamos aquí y $producto es null, hay un problema más profundo
                // o la validación no está actuando como se espera (ej. cachés de DB).
                if (!$producto) {
                    \Log::error('Producto con ID ' . $itemData['producto_id'] . ' no encontrado DESPUÉS de la validación. Posible problema de sincronización de DB o caché.', ['item_data' => $itemData]);
                    throw ValidationException::withMessages([
                        'producto_id' => "El producto con ID {$itemData['producto_id']} no fue encontrado después de la validación."
                    ]);
                }

                $precioUnitario = $producto->precio;
                $subtotalItem = $precioUnitario * $itemData['cantidad'];
                $totalGeneral += $subtotalItem;

                $productsToAttach[$producto->id] = [
                    'cantidad' => $itemData['cantidad'],
                    'precio_unitario' => $precioUnitario,
                ];
                \Log::info('Producto procesado para adjuntar.', ['producto_id' => $producto->id, 'cantidad' => $itemData['cantidad'], 'subtotal' => $subtotalItem]);
            }

            $pedido->productos()->attach($productsToAttach);
            \Log::info('Productos adjuntados al pedido.', ['pedido_id' => $pedido->id, 'attached_products' => array_keys($productsToAttach)]);

            $pedido->update(['total' => $totalGeneral]);
            \Log::info('Total del pedido actualizado.', ['pedido_id' => $pedido->id, 'total' => $totalGeneral]);

            DB::commit();
            \Log::info('Transacción de pedido confirmada con éxito.', ['pedido_id' => $pedido->id]);

            return response()->json([
                'message' => 'Pedido creado con éxito',
                'pedido' => $pedido->load('productos')
            ], 201);

        } catch (ValidationException $e) {
            DB::rollBack();
            \Log::error('Error de validación al crear el pedido (respuesta 422).', ['errors' => $e->errors(), 'request_data' => $request->all()]);
            return response()->json(['message' => 'Error de validación al crear el pedido.', 'errors' => $e->errors()], 422);
        } catch (\Exception $e) { // <-- ESTE ES EL BLOQUE QUE FALLÓ
            DB::rollBack();
            \Log::error('Error interno del servidor al crear el pedido.', [
                'error_message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString(),
                'request_data' => $request->all()
            ]);
            return response()->json(['message' => 'Error interno del servidor al crear el pedido.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Actualiza el estado de un pedido.
     * Puedes expandir esto para actualizar otros campos si es necesario.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $pedido = Pedido::find($id);
        Log::info("encontrado pedido con ID: {$id}");

        if (!$pedido) {
            return response()->json(['message' => 'Pedido no encontrado.'], 404);
        }
    
        $old_status = $pedido->estado;
    
        $validated = $request->validate([
            'estado' => 'sometimes|required|in:pendiente,entregado,cancelado,pagado',
            'metodo_envio_ticket' => 'nullable|string|in:email,descargar,ninguno',
            'cliente_email' => 'nullable|email|max:255|required_if:metodo_envio_ticket,email',
        ]);
        Log::info("validado pedido con ID: {$id}", ['validated_data' => $validated]);

        $pedido->update($validated);
    
        if ($pedido->estado === 'pagado' && $old_status !== 'pagado') {
            $pedido->loadMissing('user', 'mesa', 'productos');
    
            $pdf = Pdf::loadView('emails.tickets.pago', ['pedido' => $pedido]);
            $filename = 'ticket_pedido_' . $pedido->id . '.pdf';
            $path_in_disk = 'tickets/' . $filename;
    
            try {
                Storage::disk('public')->put($path_in_disk, $pdf->output());
                Log::info("Ticket PDF guardado en disco para Pedido ID: {$pedido->id}, ruta: {$path_in_disk}");
            } catch (\Exception $e) {
                Log::error("Error al guardar ticket PDF en disco para Pedido ID: {$pedido->id}: " . $e->getMessage());
                return response()->json([
                    'message' => 'Pedido actualizado a "pagado", pero hubo un error al guardar el ticket.',
                    'error' => $e->getMessage()
                ], 500);
            }
    
            $metodoEnvio = $request->input('metodo_envio_ticket', 'ninguno');
    
            switch ($metodoEnvio) {
                case 'email':
                    $clienteEmail = $request->input('cliente_email') ?? $pedido->user->email ?? null;
    
                    if ($clienteEmail) {
                        try {
                            Mail::to($clienteEmail)->send(new TicketPagoMail($pedido));
                            Log::info('Ticket enviado por correo para Pedido ID: ' . $pedido->id . ' al email: ' . $clienteEmail);
                            return response()->json([
                                'message' => 'Pedido actualizado a "pagado" y ticket enviado por correo.',
                                'pedido' => $pedido->load('productos')
                            ], 200);
                        } catch (\Exception $e) {
                            Log::error('Error al enviar ticket por correo para Pedido ID: ' . $pedido->id . ': ' . $e->getMessage());
                            return response()->json([
                                'message' => 'Pedido actualizado a "pagado", pero hubo un error al enviar el ticket por correo.',
                                'error' => $e->getMessage(),
                                'pedido' => $pedido->load('productos')
                            ], 500);
                        }
                    } else {
                        Log::warning('No se proporcionó un email válido para Pedido ID: ' . $pedido->id);
                        return response()->json([
                            'message' => 'Pedido actualizado a "pagado", pero no se proporcionó un email válido.',
                            'pedido' => $pedido->load('productos')
                        ], 400);
                    }
    
                case 'descargar':
                    return response()->streamDownload(function () use ($pdf) {
                        echo $pdf->output();
                    }, $filename, [
                        'Content-Type' => 'application/pdf',
                        'Content-Disposition' => 'attachment; filename="' . $filename . '"',
                    ]);
    
                case 'ninguno':
                default:
                    Log::info('Pedido pagado sin envío de ticket. Ticket fue guardado en disco.');
                    break;
            }
        }
    
        return response()->json([
            'message' => 'Pedido actualizado con éxito',
            'pedido' => $pedido->load('productos')
        ]);
    }
    

    
    /**
     * Elimina un pedido.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $pedido = Pedido::find($id);

        if (!$pedido) {
            return response()->json(['message' => 'Pedido no encontrado.'], 404);
        }

        $pedido->update(['estado' => 'cancelado']);

        return response()->json(['message' => 'Por politica solo actualiza el estado  canceasdo.'], 200);
    }
}