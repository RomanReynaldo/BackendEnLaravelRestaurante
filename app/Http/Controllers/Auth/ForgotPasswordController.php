<?php

namespace app\Http\Controllers\Auth;

use App\Http\Controllers\Controller; // <-- ¡Y AQUÍ! Importa el Controller base
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log; // Usar Log en lugar de \Log
use Illuminate\Http\JsonResponse; // Importar JsonResponse

class ForgotPasswordController extends Controller
{
    /**
     * Muestra el formulario de solicitud de correo electrónico para restablecer la contraseña.
     * app/Http/Controllers/Auth/ForgotPasswordController.php
     */
    public function showForm(): View
    {
        return view('auth.forgot-password');
    }

    /**
     * Maneja el envío del correo electrónico para restablecer la contraseña.
     */
    public function sendResetLink(Request $request): JsonResponse
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
        ], [
            'email.required' => 'El campo de correo electrónico es obligatorio.',
            'email.email' => 'Por favor, introduce una dirección de correo electrónico válida.',
            'email.exists' => 'No encontramos un usuario con ese correo electrónico.',
        ]);

        try {
            // Genera un token aleatorio y legible. ¡Este es el que se enviará y almacenará!
            $token = Str::random(21); // Laravel usa 60 caracteres por defecto para los tokens de restablecimiento.

            // Elimina cualquier token de restablecimiento existente para este correo.
            DB::table('password_reset_tokens')->where('email', $request->email)->delete();

            // Almacena el token directamente (sin hashear) en la tabla 'password_reset_tokens'.
            // Es CRÍTICO que este token NO se hashee aquí, ya que el token enviado al usuario
            // debe coincidir directamente con el almacenado. http://127.0.0.1:8000/reset-password/Ih3yvgsi/abel%40ejemplo.com
            DB::table('password_reset_tokens')->insert([
                'email' => $request->email,
                'token' => Hash::make($token), // Aquí NO se usa 
                'created_at' => Carbon::now(),
            ]);

            // Envía el correo electrónico con el enlace de restablecimiento.
            // Asegúrate de que tu vista 'auth.verify' (o 'auth.reset-password-email' si lo prefieres)
            // contenga el enlace usando el token, algo como:
            // <a href="{{ url('reset-password', $token) }}">Restablecer Contraseña</a>
            Mail::send('auth.verify', ['token' => $token, 'email' => $request->email], function ($message) use ($request) {
                $message->from(config('mail.from.address'), config('mail.from.name'));
                $message->to($request->email)->subject('Notificación para restablecer contraseña');
            });

            // Devuelve una respuesta JSON con el mensaje de éxito.
            return response()->json([
                'status' => 'success',
                'message' => '¡Le hemos enviado un enlace para restablecer su contraseña! :) Por favor, revise su bandeja de entrada (y la carpeta de spam).'
            ], 200); // Código de estado HTTP 200 (OK)

        } catch (\Exception $e) {
            // Registra el error para depuración.
            Log::error('Error al enviar correo de restablecimiento de contraseña: '.$e->getMessage());

            // Devuelve una respuesta JSON con un mensaje de error.
            return response()->json([
                'status' => 'error',
                'message' => 'Ocurrió un error al enviar el correo de restablecimiento. Por favor, inténtelo de nuevo.'
            ], 500); // Código de estado HTTP 500 (Internal Server Error)
        }
    }
}