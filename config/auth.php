<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Defaults
    |--------------------------------------------------------------------------
    |
    | This option controls the default authentication "guard" and password
    | reset options for your application. You may change these defaults
    | as required, but they're a sensible starting point.
    |
    */

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'users',
    ],

    /*
    |--------------------------------------------------------------------------
    | Authentication Guards
    |--------------------------------------------------------------------------
    |
    | Next, you may define every authentication guard for your application.
    | Of course, a great default configuration has been defined for you
    | here. Here are the default Laravel drivers:
    |
    | Laravel Sanctum is a lightweight authentication system for SPAs and mobile applications.
    | When using it, you typically want to use the 'sanctum' guard for your API routes.
    |
    */

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],

        'api' => [ // <-- ¡¡IMPORTANTE!! Este es el guard 'api' para Sanctum.
            'driver' => 'sanctum', // Usa el driver 'sanctum'
            'provider' => 'users',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | User Providers
    |--------------------------------------------------------------------------
    |
    | All authentication drivers have a user provider. This defines how the
    | users are actually retrieved out of your database or other storage
    | mechanisms to authenticate a user.
    |
    | If you have multiple user tables or models, you may configure multiple
    | sources here.
    |
    */

    'providers' => [
        'users' => [
            'driver' => 'eloquent',
            'model' => App\Models\User::class, // Asegúrate de que esta ruta sea correcta para tu modelo User
        ],

        // 'users' => [
        //     'driver' => 'database',
        //     'table' => 'users',
        // ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Resetting Passwords
    |--------------------------------------------------------------------------
    |
    | You may specify how many seconds before a password reset token expires.
    | This security feature keeps tokens from lingering indefinitely.
    | You may also specify the number of seconds that can elapse before
    | another password reset link can be requested.
    |
    */

    'passwords' => [
        'users' => [
            'provider' => 'users',
            'table' => env('AUTH_PASSWORD_RESET_TOKEN_TABLE', 'password_reset_tokens'), // <--- ¡Copia esto!
            'expire' => 60,
            'throttle' => 60,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Password Confirmation Timeout
    |--------------------------------------------------------------------------
    |
    | Here you may define the amount of seconds that lasts the password
    | confirmation window. By default, the window lasts for three hours.
    |
    */

    'password_timeout' => 10800,

];