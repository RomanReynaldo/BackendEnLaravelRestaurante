<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User; // Asegúrate de importar el modelo User
use Illuminate\Support\Facades\Hash; // ¡IMPORTANTE: Añadir esta línea!
use Illuminate\Support\Facades\Validator; // ¡IMPORTANTE: Añadir esta línea!
use Spatie\Permission\Models\Role; // ¡IMPORTANTE: Añadir esta línea!

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::all(); // Obtener todos los usuarios

        return response()->json([
            'message' => 'Lista de usuarios',
            'data' => $users // Envía los usuarios bajo una clave 'data' o similar
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * Este método ahora se llama 'store' para coincidir con apiResource.
     * Se encarga de crear un nuevo usuario y asignarle un rol de Spatie.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'role' => 'required|string|in:admin,mesero,comensal', // La validación sigue siendo útil aquí
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        // 1. Crear el usuario SIN asignar la columna 'role' inicialmente en el create
        // La columna 'role' se actualizará DESPUÉS de asignar con Spatie
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            // No asignamos 'role' aquí, lo haremos después de Spatie
            // 'role' => $request->role ?? 'comensal', // <-- ELIMINA o COMENTA esta línea
        ]);

        // 2. Lógica de asignación de rol con Spatie (la que ya tienes y funciona bien)
        $requestedRoleName = $request->input('role');
        $defaultRoleName = 'comensal';

        $roleToAssign = Role::where('name', $requestedRoleName)->first();

        if (!$roleToAssign) {
            $roleToAssign = Role::where('name', $defaultRoleName)->first();
            if (!$roleToAssign) {
                 return response()->json(['message' => 'Error de configuración: El rol por defecto "'. $defaultRoleName .'" no existe.'], 500);
            }
        }

        $user->assignRole($roleToAssign); // Asigna el rol al usuario usando Spatie

        // 3. ¡NUEVO! Actualiza la columna 'role' del usuario con el nombre del rol asignado por Spatie
        $user->update(['role' => $roleToAssign->name]);


        // 4. Crear token de autenticación para el nuevo usuario
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json([
            'message' => 'Usuario registrado exitosamente',
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                // Puedes devolver el rol directamente de la columna 'role' o de Spatie,
                // pero si la actualizaste, ambos deberían coincidir ahora.
                'role_en_columna' => $user->role, // Muestra el valor de la columna 'role'
                'roles_spatie' => $user->getRoleNames(), // Muestra los roles de Spatie
            ]
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::findOrFail($id); // Buscar usuario por ID

        return response()->json([
            'message' => 'Detalle de usuario',
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'roles' => $user->getRoleNames(), // Mostrar roles de Spatie
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ]
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $user = User::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|string|email|max:255|unique:users,email,'.$id, // Excluir email del usuario actual
            'password' => 'nullable|string|min:8', // Contraseña opcional al actualizar
            'role' => 'nullable|string|in:admin,mesero,comensal', // Permitir actualizar rol
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $userData = $request->only(['name', 'email']);
        if ($request->filled('password')) {
            $userData['password'] = Hash::make($request->password);
        }

        $user->update($userData);

        // === Lógica de actualización de rol con Spatie ===
        if ($request->filled('role')) {
            $newRoleName = $request->input('role');
            $newRole = Role::where('name', $newRoleName)->first();

            if ($newRole && !$user->hasRole($newRoleName)) {
                // Eliminar roles actuales y asignar el nuevo
                $user->syncRoles([$newRole]);
                // Opcional: Si solo quieres añadir y no sincronizar: $user->assignRole($newRole);
            } else if (!$newRole) {
                return response()->json(['message' => 'El rol especificado para actualizar no existe.'], 400);
            }
        }
        // === Fin de lógica de actualización de rol ===

        return response()->json([
            'message' => 'Usuario actualizado con ID: ' . $id,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'roles' => $user->getRoleNames(),
            ]
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return response()->json(['message' => 'Usuario eliminado con ID: ' . $id]);
    }
}