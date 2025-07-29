<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

# Nombre del Proyecto: "Sistema de Gestion de servicios de Restaurante)

### 1. Encabezado

* **Nombre del Proyecto:** [Tu nombre de proyecto aquí, ej: "Sistema de Gestión de Restaurante"]

* **Número de Equipo:** [ "Equipo 14"]

* **Integrantes:**

  * [Roman Mendoza Reynaldo] - [Rol: "Desarrollador Backend"]

  * Santiago Jimenez Abel] - [Rol: "Desarrollador Frontend"]

  

  * ...

* **¿Qué hace el sistema?**
  ["Este sistema permite la gestión integral de un restaurante, abarcando desde la administración de productos y mesas hasta la toma y seguimiento de pedidos, y la gestión de usuarios con diferentes roles, se integra la opción de ticket a correo o descargable, ademas se pueden recuiperar contrasenias de usuarios ."]

* **Tipo de sistema:** ["Sistema Web responsiva para usuarios sin cuenta par visiaoizar menu"]

# 2. Funcionalidades Clave con Imágenes

#### Proceso de Logueo

[Aca se valida que exista el usuario y su rol para mostrar secciónes especificas y privilegios.]

![Controladores para API Login](/images/controladores%20para%20api%20login.png)


#### Niveles de Usuario | Rol

[Detalla los diferentes roles de usuario y sus permisos, ej: "Administrador, Mesero, Comensal."]

![Rutas APIs para Frontend](/images/rutas%20APIs%20para%20frontEnd.png)

#### CRUD de Usuarios

[Describe cómo se gestionan los usuarios  a través de permisos (crear, leer, actualizar, eliminar).]

![de roles y permisos](/images/crudRoles.png)

#### CRUD de Productos

[Describe cómo se gestionan los productos (crear, leer, actualizar, eliminar).]

![de roles y permisos](/images/crudProductos.png)

#### Proceso Principal (Ejemplo: Venta de Productos)

[ "El mesero toma un pedido desde la mesa, añade productos, y el pedido se envía a cocina. El admin tambien como el mesero puede ver el estado de  pedido y confirmar o cobrar. El admin es el unico que puede eliminar o desactivar usuarios o cancelar pedidos"]

![de roles y permisos](/images/crudPedidosPDF.png)

#### Envío de Correo Electrónico con PDF Adjunto

[ "Se genera un ticket de pago en formato PDF utilizando la librería Dompdf") la librería que  se usa para el envío ("Para el envío de correos, se utiliza Laravel Mail con la configuración SMTP de Mailtrap/SendGrid").]

![Generación de PDF](/images/generacionde%20pdf.png)

![Ticket en Correo Adjunto](/images/ticket%20en%20correo%20adjunto.png)

## Otras Funcionalidades Únicas del Proyecto

* [Funcionalidad única 1, ej: "Gestión de Mesas en tiempo real.Si el usuario crea nuevo pedido puede seleccionar mesas y ver su estado actual si esta libre ocupada o no disponible"]

* [Funcionalidad única 2, ej: El usuario invitado o publico general en este caso se llama comensal puede escanear QR para acceder al menu de productos y visualizar. Cada producto tienedescripcion breve con el fin de provocar apetito al usuario."]

* ...
### Restableciéndomelos password
![Link al Correo para Restablecer Contraseña](/images/link%20al%20correo%20restet%20password.png)

### paquetes integrados
![Paquetes Integrados](/images/PaquetesIntegrados.png)
### vista de restablecer password
![Vista de Link de Restablecimiento de Contraseña](/images/VistadeLinkRestePassword.png)
### visualización de productos en sql
![Productos en Base de Datos](/images/productos%20en%20bases%20de%20datos.png)
### visualización de los tokens
![Tokens Generados en la Base de Datos](/images/tokensGENRADOS%20EN%20LA%20BASE%20DEDATSO.png)
### por si se necesita manualmente ver detalles de pedidos
![Visualización de Detalles de Pedidos](/images/vISUALIZACION%20DE%20DETALLES%20PEDIDOS.png)
### configuracion de datos iniciales
![Configuración de .env para Datos Iniciales](/images/Config%20de%20env%20para%20datos%20iniciales%20y%20configuraciones%20del%20entorno.png)
### Por protocolo se guardan tickest en el servidor también 
![Tickets Guardados en el Servidor para Respaldo](/images/tickets%20guardado%20en%20servidor%20para%20respaldo.png)


# 3. APIs Laravel y Consumo de las Mismas con Imágenes

[El backend de Laravel expone una serie de APIs RESTful que permiten la interacción con la base de datos y la lógica de negocio del sistema. Estas APIs están protegidas en su mayoría por autenticación basada en tokens (Laravel Sanctum) y middlewares de roles, asegurando que solo los usuarios autorizados puedan acceder a los recursos pertinentes.

.")]

**Ejemplo de Consumo de API (Frontend):**

// Ejemplo de petición GET para obtener productos
fetch('http://127.0.0.1:8000/api/productos', {
headers: {
'Authorization': 'Bearer [TU_TOKEN_SANCTUM]' // Si requiere autenticación
}
})
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error('Error:', error));

// Ejemplo de petición POST para login
fetch('http://127.0.0.1:8000/login', {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({ email: 'usuario@ejemplo.com', password: 'password' }),
})
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error('Error:', error));


# Principales Endpoints de la API

## Autenticación

- **POST** `/login`: Permite a los usuarios iniciar sesión y obtener un token de autenticación (o establecer una sesión).
- **POST** `/logout`: Invalida la sesión o el token del usuario autenticado.
- **POST** `/password/email`: Inicia el proceso de restablecimiento de contraseña enviando un enlace al correo del usuario.
- **GET** `/password/reset/{token}`: Valida el token de restablecimiento de contraseña.
- **POST** `/password/reset`: Permite al usuario establecer una nueva contraseña utilizando un token válido.

## Gestión de Productos

- **GET** `/productos`: Obtiene la lista de todos los productos.
- **POST** `/productos`: Crea un nuevo producto (requiere rol admin o mesero).
- **PUT** `/productos/{id}`: Actualiza un producto existente (requiere rol admin o mesero).
- **DELETE** `/productos/{id}`: Elimina un producto (requiere rol admin).

## Gestión de Pedidos

- **GET** `/pedidos`: Obtiene la lista de pedidos (filtrable por rol).
- **GET** `/pedidos/{id}`: Obtiene los detalles de un pedido específico.
- **POST** `/pedidos`: Crea un nuevo pedido (requiere rol admin o mesero).
- **PUT** `/pedidos/{id}`: Actualiza un pedido (requiere rol admin o mesero).
- **DELETE** `/pedidos/{id}`: Elimina un pedido (requiere rol admin).

## Gestión de Usuarios

- **GET** `/usuarios`: Obtiene la lista de usuarios (requiere rol admin).
- **POST** `/usuarios`: Crea un nuevo usuario (requiere rol admin).
- **GET** `/usuarios/{id}`: Obtiene los detalles de un usuario específico (requiere rol admin).
- **PUT** `/usuarios/{id}`: Actualiza un usuario existente (requiere rol admin).
- **DELETE** `/usuarios/{id}`: Elimina un usuario (requiere rol admin).

## Gestión de Categorías

- **GET** `/categorias`: Obtiene la lista de categorías (requiere rol admin).
- **POST** `/categorias`: Crea una nueva categoría (requiere rol admin).
- **PUT** `/categorias/{id}`: Actualiza una categoría existente (requiere rol admin).
- **DELETE** `/categorias/{id}`: Elimina una categoría (requiere rol admin).

## Gestión de Mesas

- **GET** `/mesas`: Obtiene la lista de mesas (requiere rol admin o mesero).
- **POST** `/mesas`: Crea una nueva mesa (requiere rol admin).
- **PUT** `/mesas/{id}`: Actualiza una mesa existente (requiere rol admin o mesero).
- **DELETE** `/mesas/{id}`: Elimina una mesa (requiere rol admin).


## Ejem[lo de postman
![de roles y permisos](/images/postman.png)


## 4. Dependencias y Configuración

### Requisitos Mínimos para Poner en Marcha el Proyecto

- **PHP**: PHP 8.2 o superior  
- **Composer**: Composer 2.x  
- **Node.js**: Node.js 18.x o superior  
- **NPM / Yarn**: NPM 9.x o superior / Yarn 1.x  
- **Base de Datos**: MariaDB v.10.6.x / MySQL v.8.0.x / PostgreSQL v.14.x  
- **Servidor Web**: Nginx, Apache o `php artisan serve` para desarrollo

### Pasos para la Configuración Local

### Pasos para la Configuración Local

```bash
# 1. Clonar el repositorio
git clone https://github.com/RomanReynaldo/BackendEnLaravelRestaurante.git
cd BackendEnLaravelRestaurante

# 2. Instalar dependencias de Composer
composer install

# 3. Instalar dependencias de Node.js
npm install
# o si usas yarn
yarn install

# 4. Copiar el archivo de entorno
cp .env.example .env

# 5. Generar la clave de aplicación
php artisan key:generate

# 6. Configurar la base de datos en .env
# (Abre el archivo .env y edita las siguientes líneas)
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=tu_base_de_datos
DB_USERNAME=tu_usuario
DB_PASSWORD=tu_contraseña

# 7. Ejecutar las migraciones y seeders (opcional)
php artisan migrate --seed

# 8. Configurar el envío de correos en .env
MAIL_MAILER=smtp
MAIL_HOST=sandbox.smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=tu_usuario_mailtrap
MAIL_PASSWORD=tu_password_mailtrap
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="no-reply@tudominio.com"
MAIL_FROM_NAME="${APP_NAME}"
FRONTEND_URL=http://localhost:4200

# 9. Iniciar el servidor de desarrollo de Laravel
php artisan serve

# 10. Compilar los assets de frontend (si tienes vistas Blade que usen Vite/Mix)
npm run dev
# o si usas yarn
yarn dev
```

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains thousands of video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the [Laravel Partners program](https://partners.laravel.com).

### Premium Partners

- **[Vehikl](https://vehikl.com)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel)**
- **[DevSquad](https://devsquad.com/hire-laravel-developers)**
- **[Redberry](https://redberry.international/laravel-development)**
- **[Active Logic](https://activelogic.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
