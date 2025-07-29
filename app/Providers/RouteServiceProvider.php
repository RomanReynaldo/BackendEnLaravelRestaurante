<?php

// app/Providers/RouteServiceProvider.php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter; // Asegúrate de importar esto
use Illuminate\Support\Facades\Route; // Asegúrate de importar esto

class RouteServiceProvider extends ServiceProvider
{
    // ... (otras propiedades y constructores)

    /**
     * Define your route model bindings, pattern filters, and other route configuration.
     *
     * @return void
     */
    public function boot()
    {
        $this->configureRateLimiting(); // Si ya tienes este método, verifica su contenido.

        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }

    /**
     * Configure the rate limiters for the application.
     *
     * @return void
     */
    protected function configureRateLimiting()
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by($request->user()?->id ?: $request->ip());
        });

        // Opcional, si usas 'throttle:guest' en alguna parte:
        RateLimiter::for('guest', function (Request $request) {
            return Limit::perMinute(60)->by($request->ip());
        });
    }
}