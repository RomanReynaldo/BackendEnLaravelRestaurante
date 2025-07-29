<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket de Pago</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f8f8f8;
            color: #333;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header img {
            max-width: 150px; /* Ajusta el tamaño de tu logo */
            margin-bottom: 15px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
            color: #555;
        }
        .company-info {
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            color: #777;
        }
        .company-info p {
            margin: 5px 0;
        }
        .ticket-details {
            margin-bottom: 30px;
            border-top: 1px dashed #ccc;
            padding-top: 20px;
        }
        .ticket-details p {
            margin: 8px 0;
        }
        .ticket-details strong {
            display: inline-block;
            width: 120px;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        .items-table th, .items-table td {
            border: 1px solid #eee;
            padding: 10px;
            text-align: left;
        }
        .items-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            border-top: 1px dashed #ccc;
            padding-top: 10px;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 12px;
            color: #999;
            border-top: 1px solid #eee;
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            @if(file_exists(public_path('storage/logo.png')))
                <img src="{{ public_path('storage/logo.png') }}" alt="Logo de la Empresa">
            @else
                <h1>{{ config('app.name') }}</h1>
            @endif
            <h1>Ticket de Pago</h1>
        </div>

        <div class="company-info">
            <p>Tasca Don Quino S.A. de C.V.</p>
            <p>Dirección: Calle Libres #123, Colonia Centro, Oaxaca, México</p>
            <p>Tel: (951) 123-4567 | Email: info@tasca_don_quino.com</p>
            <p>RFC: DOQT760914RT</p>
        </div>

        <div class="ticket-details">
            <p><strong>Pedido #ID:</strong> {{ $pedido->id }}</p>
            <p><strong>Fecha:</strong> {{ $pedido->created_at->format('d/m/Y H:i') }}</p>
            <p><strong>Mesa:</strong> {{ $pedido->mesa->nombre ?? 'N/A' }}</p>
            <p><strong>Atendido por:</strong> {{ $pedido->user->name ?? 'Sistema' }}</p>
            <p><strong>Estado:</strong> {{ ucfirst($pedido->estado) }}</p>
        </div>

        <table class="items-table">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>P. Unitario</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                @foreach($pedido->productos as $producto)
                    <tr>
                        <td>{{ $producto->nombre }}</td>
                        <td>{{ $producto->pivot->cantidad }}</td>
                        <td>${{ number_format($producto->pivot->precio_unitario, 2) }}</td>
                        <td>${{ number_format($producto->pivot->cantidad * $producto->pivot->precio_unitario, 2) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <div class="total">
            Total: ${{ number_format($pedido->total, 2) }}
        </div>

        <div class="footer">
            <p>¡Gracias por tu compra! Vuelve pronto.</p>
            <p>Este es un recibo digital, no es un comprobante fiscal.</p>
        </div>
    </div>
</body>
</html>