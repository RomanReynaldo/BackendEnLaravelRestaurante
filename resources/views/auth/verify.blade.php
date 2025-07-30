<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restablecer tu Contraseña</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #4361ee;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        .content {
            margin: 20px 0;
            text-align: center;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4361ee;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }
        .footer {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-top: 20px;
        }
        /* Esto es para clientes de correo como Gmail que a veces modifican estilos */
        .ii a[href] {
            color: white !important;
        }
        /* Estilo para el código de seguridad */
        .security-code {
            font-size: 1.2em;
            color: #333;
            background-color: #f0f0f0;
            padding: 8px 12px;
            border-radius: 4px;
            display: inline-block; /* Para que el padding y background funcionen bien */
            margin: 15px 0; /* Espacio alrededor del código */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Restablece tu Contraseña</h2>
        </div>
        <div class="content">
            <p>Hola,</p>
            <p>Hemos recibido una solicitud para restablecer la contraseña de tu cuenta. Haz clic en el botón de abajo para proceder:</p>

            {{-- Botón para restablecer la contraseña --}}
            {{-- Es buena práctica incluir el email en el enlace de reset también --}}
            <a href="{{ url('reset-password', ['token' => $token, 'email' => $email]) }}" class="btn">Restablecer Contraseña</a>

            <p style="margin-top: 25px;">
                **O copia este código de seguridad si el botón no funciona:**
            </p>
            <p class="security-code">
                {{ $token }}
            </p>

            <p style="margin-top: 20px;">
                Este enlace y código expirarán en 60 minutos por tu seguridad.
            </p>
        </div>
        <div class="footer">
            <p>Si no solicitaste un restablecimiento de contraseña, no se requiere ninguna acción adicional.</p>
            <p>Saludos,</p>
            <p>Tu Equipo</p>
        </div>
    </div>
</body>
</html>