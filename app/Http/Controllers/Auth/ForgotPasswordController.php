<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash; // <-- ¡¡ESTA LÍNEA ES CRÍTICA Y FALTABA!!
use Illuminate\View\View;
use App\Models\User;
use Carbon\Carbon;

class ForgotPasswordController extends Controller
{
    /** Show the email request form */
    public function showForm(): View
    {
        return view('auth.forgot-password');
    }

    /** Handle the email submission */
    public function sendResetLink(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
        ]);

        try {
            $token = Str::random(40);

            // Delete existing reset tokens
            DB::table('password_reset_tokens')->where('email', $request->email)->delete();

            // Store new reset token (hash)
            DB::table('password_reset_tokens')->insert([
                'email' => $request->email,
                'token' => Hash::make($token), // <-- ¡¡ESTA ES LA LÍNEA CRÍTICA!!
                'created_at' => Carbon::now(),
            ]);

            // Send email
            Mail::send('auth.verify', ['token' => $token], function ($message) use ($request) {
                $message->from(config('mail.from.address'), config('mail.from.name'));
                $message->to($request->email)->subject('Reset Password Notification');
            });

            return redirect('/login')->with('success', 'Le hemos enviado un link para resetear su contraseña! :)');

        } catch (\Exception $e) {
            \Log::error('Password Reset Email Error: '.$e->getMessage());
            return back()->with('error', 'Something went wrong while sending the reset email. Please try again.');
        }
    }
}