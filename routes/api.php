<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ProductoController;
use App\Http\Controllers\API\PedidoController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\API\CategoriaController;
use App\Http\Controllers\API\MesaController; // Asegúrate de tener este controlador

// use App\Http\Controllers\API\DetallePedidoController; // Descomenta si tienes este controlador

// Rutas de autenticación
Route::post('/login', [AuthController::class, 'login'])->name('login');


// Rutas para la recuperación de contraseña (¡AÑADIDAS AQUÍ!)
// Ruta para solicitar el enlace de restablecimiento (el frontend envía solo el email)
Route::post('password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');

// Ruta para que el frontend valide el token antes de mostrar el formulario de nueva contraseña
// El frontend hará un GET a esta URL (con el token y email de la URL del correo)
Route::get('password/reset/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');

// Ruta para restablecer la contraseña (el frontend envía email, token, nueva_password, confirmacion_password)
Route::post('password/reset', [ResetPasswordController::class, 'updatePassword'])->name('password.update');


// Ruta de prueba (útil durante el desarrollo)
Route::get('/api/saludo', function () {
    return response()->json(['mensaje' => 'Hola desde la ruta de prueba!']);
});

// Rutas públicas de productos (accesibles sin autenticación)




// GRUPO DE RUTAS QUE REQUIEREN AUTENTICACIÓN (auth:sanctum)
Route::middleware(['auth:sanctum'])->group(function () {

    // LOGOUT
    Route::post('/logout', [AuthController::class, 'logout']);


    // PRODUCTOS (con middlewares individuales)
    Route::get('/productos', [ProductoController::class, 'index']);
    Route::post('/productos', [ProductoController::class, 'store'])->middleware('role:admin|mesero'); // Individual
    Route::put('/productos/{id}', [ProductoController::class, 'update'])->middleware('role:admin|mesero'); // Individual
    Route::delete('/productos/{id}', [ProductoController::class, 'destroy'])->middleware('role:admin'); // Individual


    // PEDIDOS (con middlewares individuales)
    Route::post('/pedidos', [PedidoController::class, 'store'])->middleware('role:admin|mesero');
    Route::put('/pedidos/{id}', [PedidoController::class, 'update'])->middleware('role:admin|mesero');
    Route::get('/pedidos', [PedidoController::class, 'index'])->middleware('role:admin|mesero|comensal');
    Route::get('/pedidos/{id}', [PedidoController::class, 'show'])->middleware('role:admin|mesero|comensal');
    Route::delete('/pedidos/{id}', [PedidoController::class, 'destroy'])->middleware('role:admin');


    // USUARIOS
    // apiResource aplica middlewares a todas sus rutas.
    // Si quieres un control más granular, tendrías que definir cada ruta de usuarios manualmente.
    // Por ahora, lo mantenemos como apiResource porque el admin tiene todos los permisos.
    Route::middleware('role:admin')->apiResource('usuarios', UserController::class);


    // ¡NUEVAS RUTAS!
    // CATEGORIAS (Solo admin puede gestionar)
    Route::middleware('role:admin')->apiResource('categorias', CategoriaController::class);

    // MESAS (Admin puede gestionar, mesero puede ver y actualizar estado)
    Route::apiResource('mesas', MesaController::class)->except(['destroy'])->middleware('role:admin|mesero'); // Mesero puede ver y actualizar
    Route::delete('/mesas/{id}', [MesaController::class, 'destroy'])->middleware('role:admin'); // Solo admin puede eliminar


   
    // DETALLE DE PEDIDOS (Descomentar si tienes este controlador)
    /*
    Route::post('/detalle-pedidos', [DetallePedidoController::class, 'store'])->middleware('role:admin');
    Route::get('/detalle-pedidos/{id}', [DetallePedidoController::class, 'show'])->middleware('role:admin|mesero|comensal');
    Route::put('/detalle-pedidos/{id}', [DetallePedidoController::class, 'update'])->middleware('role:admin');
    Route::delete('/detalle-pedidos/{id}', [DetallePedidoController::class, 'destroy'])->middleware('role:admin');
    */
});