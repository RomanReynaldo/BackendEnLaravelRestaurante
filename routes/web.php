<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\ResetPasswordController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Agrega esta ruta si no la tienes, o asegúrate de que exista y apunte a una vista existente.
Route::get('/', function () {
    return view('welcome'); // Esto asume que tienes un archivo welcome.blade.php
});

// Ejemplo de ruta de login (si no la tienes ya en web.php)
Route::get('/login', function () {
    return view('auth.login'); // Asegúrate que auth.login exista ahora
})->name('login');

// ------------------------------------------------------------------------
// RUTAS PARA EL RESTABLECIMIENTO DE CONTRASEÑA (WEB)
// ------------------------------------------------------------------------

// RUTAS DE FORGOT PASSWORD (Olvido de Contraseña)
Route::controller(ForgotPasswordController::class)->group(function () {
    // Ruta GET para mostrar el formulario de "Olvidé mi contraseña" (email.blade.php)
    // El método en el controlador es showLinkRequestForm
    Route::get('forgot-password', 'showForm')->name('password.request');

    // Ruta POST para enviar el email con el enlace de restablecimiento (desde email.blade.php)
    // El método en el controlador es sendResetLink
    Route::post('forgot-password', 'sendResetLink')->name('password.email');
});

// RUTAS DE RESET PASSWORD (Restablecimiento de Contraseña)
Route::controller(ResetPasswordController::class)->group(function () {
    // Ruta GET para mostrar el formulario de restablecimiento (reset.blade.php)
    // El {token} viene del enlace del email.
    // El método en el controlador es showResetForm
    Route::get('reset-password/{token}', 'getPassword')->name('password.reset');

    // Ruta POST para procesar la nueva contraseña (desde reset.blade.php)
    // El método en el controlador es updatePassword
    Route::post('reset-password', 'updatePassword')->name('password.update');
});
// ... tus otras rutas web ...