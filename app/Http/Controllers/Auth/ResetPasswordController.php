<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use App\Models\User;

class ResetPasswordController extends Controller
{
    /**
     * Show the reset password form.
     *
     * @param  string  $token
     * @return \Illuminate\View\View
     */
    public function getPassword($token)
    {
        return view('auth.passwords.reset-password', ['token' => $token]);
    }

    /**
     * Handle the password reset process.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function updatePassword(Request $request)
    {
        try {
            // Validate the request inputs
            $request->validate([
                'email'    => 'required|email|exists:users,email',
                'password' => 'required|string|min:8|confirmed',
                'token'    => 'required',
            ]);

            // Find password reset record
            $resetRecord = DB::table('password_reset_tokens')
                ->where('email', $request->email)
                ->first();

            if (!$resetRecord || !Hash::check($request->token, $resetRecord->token)) {
                return back()->with('error', 'Invalid token!')->withInput();
            }

            // Check if the token has expired (valid for 60 minutes)
            if (Carbon::parse($resetRecord->created_at)->addMinutes(60)->isPast()) {
                return back()->with('error', 'The password reset link has expired.')->withInput();
            }

            // Find the user and update the password
            $user = User::where('email', $request->email)->first();

            if ($user) {
                $user->update([
                    'password' => Hash::make($request->password),
                ]);

                // Delete the used password reset record
                DB::table('password_reset_tokens')->where('email', $request->email)->delete();

            }

            // Devuelve una respuesta JSON con el mensaje de éxito.
                return response()->json([
                'status' => 'success',
                'message' => '¡Le hemos actualizado su contraseña!  Por favor, innicie sesion.'
                ], 200); // Código de estado HTTP 200 (OK)


            } catch (\Exception $e) {
                Log::error('Error updating password: ' . $e->getMessage()); // Indentación corregida
                // Devuelve una respuesta JSON con un mensaje de error.
                return response()->json([
                    'status' => 'error',
                    'message' => 'Ocurrió un error de restablecimiento. Por favor, inténtelo de nuevo.'
                ], 500); // Aquí faltaba un paréntesis de cierre y el código de estado era incorrecto.
            }
        }
}



