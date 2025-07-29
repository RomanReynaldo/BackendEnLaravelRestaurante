<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role; // <-- ¡IMPORTANTE! Añade esta importación

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (!Auth::attempt($credentials)) {
            return response()->json(['message' => 'Credenciales inválidas'], 401);
        }

        $user = Auth::user();

        // Crear token de acceso personal
        $token = $user->createToken('api-token')->plainTextToken;

        // === ¡CAMBIO AQUÍ! ===
        // Obtener los nombres de los roles del usuario usando Spatie
        $roles = $user->getRoleNames(); // Esto devuelve una colección de nombres de roles (ej: ['admin', 'mesero'])
        // Si sabes que un usuario solo tendrá un rol, puedes tomar el primero:
        // $mainRole = $roles->first();
        // O si quieres devolver todos los roles para mayor flexibilidad:
        // $roles->toArray() para convertirlo en un array plano si el frontend lo prefiere

        return response()->json([
            'token' => $token,
            'user_info' => [ // Puedes agrupar la información del usuario si lo deseas
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'roles' => $roles, // Devolvemos la colección de roles (ej: ['admin'])
                // Opcional: si solo quieres el primer rol como string:
                // 'role' => $roles->first(),
            ]
        ]);
        // === FIN DEL CAMBIO ===
    }

    public function logout(Request $request)
    {
        // Elimina el token actual
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logout exitoso']);
    }
}