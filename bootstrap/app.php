<?php

// bootstrap/app.php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Cache\RateLimiting\Limit; // <-- Asegúrate de que esta línea esté
use Illuminate\Http\Request;             // <-- Asegúrate de que esta línea esté
use Illuminate\Support\Facades\RateLimiter; // <-- Asegúrate de que esta línea esté

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',

       
    )
    ->withMiddleware(function (Middleware $middleware): void {
        // Registra los aliases de middleware de Spatie aquí
        $middleware->alias([
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
        ]);

        // Si tienes otros middlewares de API o web que necesiten ser registrados aquí, añádelos también.
        // Por ejemplo, si tu grupo 'api' en Kernel.php tiene middlewares que quieres mover aquí:
        $middleware->api([
            \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
            'throttle:api',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ]);

        // Si tienes un middleware personalizado como el tuyo en App\Http\Middleware\RoleMiddleware
        // y quieres usarlo en lugar del de Spatie, entonces cambia la línea de 'role'
        // a 'role' => \App\Http\Middleware\RoleMiddleware::class,
        // Pero lo más común es usar el de Spatie.
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();