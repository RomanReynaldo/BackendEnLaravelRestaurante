
# 1. Sistema de Gestion de servicios de Restaurante: Frontned


* **Nombre del Proyecto:** [Sistema de Gestión de Restaurante]

* **Número de Equipo:** [ Equipo 14]

* **Integrantes:**

  * [Roman Mendoza Reynaldo] - [Rol: Desarrollador Backend]

  * Santiago Jimenez Abel] - [Rol: Desarrollador Frontend]

  

  * ...

* **¿Qué hace el sistema?**
  [Este sistema permite la gestión integral de un restaurante, abarcando desde la administración de productos y mesas hasta la toma y seguimiento de pedidos, y la gestión de usuarios con diferentes roles, se integra la opción de ticket a correo o descargable, ademas se pueden recuiperar contrasenias de usuarios .]

* **Tipo de sistema:** [Sistema Web responsiva para usuarios sin cuenta par visualizar menu]

# 2. Funcionalidades Clave con Imágenes

La interfaz esta diseñada para que 3 tipos de usuarios puedan visitar y manipular el sitio web.
#### Rol comensal-publico en general:
 * Puede visualizar el menu del restaurante.
#### Rol de mesero
 * Puede visualizar el menu.
 * Tomar pedidos
 * Autorizar los pedidos modificando su estado, desde pendiente, entregado, pagado, en la vista de control de pedidos.
#### Rol de admin
 * Editar la plantilla de empleados desde la vista crud-empleados
 * Editar las opciones del menu desde la vista de crud-menus
 * Puede visualizar el menu.
 * Tomar pedidos
 * Autorizar los pedidos modificando su estado, desde pendiente, entregado, pagado, en la vista de control de pedidos.

### Proceso de Logeo

En esta interfaz, con el uso de dos inputs, uno de correo y otro contraseña. Esta vista esta diseñada para validar las credenciales de usuarios con roles como mesero o administrador, para poder desempeñar sus tareas en el restaurante.

Interfaz de login <img width="1910" height="880" alt="Screenshot 2025-07-29 081349" src="https://github.com/user-attachments/assets/f574c231-322c-4e17-938e-226339bc5c7e" />
El componenten login cuenta con un metodo llamado submit(), donde realizamos una llamada al endpoint api/login/ donde enviamos el email y la contraseña que son capturados en el formulario de login. De existir las credenciales, otorgara acceso y guardara elementos resultantes de esta llamada al api como el token y el rol de dicho usuario logeado.

#### Recuperacion de contraseñas

<img width="666" height="462" alt="image" src="https://github.com/user-attachments/assets/1e01da11-f7e1-4be8-9d52-1b70e4bb60ad" />
Nuestra recuperacion de contraseña inicie cuando hacemos clic en el elemento "Ha olvidado su contraseña?", que lo lleva a un formulario para capturar su correo electronico.
Esto inicia un evento que nos lleva a otra vista.
Cuando subimos nuestro correo para recuperacion, con el metodo submit(), donde hacemos una llamada al endpoint password/email, con los contenidos del email. Esto mandara un token al correo del administrador para que el empleado pueda consultarlo.
<img width="625" height="789" alt="image" src="https://github.com/user-attachments/assets/1d015a5b-9f75-486b-850b-60fa38f4b2c0" />
Esto nos llevara a este formulario donde rellenamos los campos para aplicar una nueva contraseña de inicio de sesion.

### Visualizacion de menus

Se incorporo un buscador para navegar el menu y paginacion a las tarjetas de platillos. 
La barra de navegacion es una coleccion de routerLink que nos lleva a otras vistas, aun que estas vistas estan restringidas dependiendo del rol del usuario. En este componente verificamos el rol y limitamos las vistas a la que el usuario puede acceder desde la barra de navegacion.

Tambien involucramos el metodo cerrarSesion(), que nos permite llamada al api/logout para destruir el token otorgado al usuario en su login y limpiamos las variables locales de sesion.
<img width="1913" height="884" alt="Screenshot 2025-07-29 090407" src="https://github.com/user-attachments/assets/eed4b0b1-f05e-48e4-8591-e20885e96630" />

<img width="1913" height="805" alt="Screenshot 2025-07-29 090420" src="https://github.com/user-attachments/assets/38fb5de1-f226-42c7-b6a0-22d7b71db437" />

### Visualizacion de orden de pedidos


En esta vista el mesero y administrador, pueden tomar pedidos de los clientes, seleccionarlos de la lista, con la ayuda de un buscador y los añadimos al 
En esta clase contamos con una variedad de metodos.

##### obtenerMesas()

Con este metodo llamada al endpoint api/mesas para saber las mesas que existen en el restaurante.
##### obtenerPlatillos()

En este metodo obtenemos los datos de la coleccion del menu, las repartimos en una tabla paginada para una facil lectura y visualizacion, tambien se implemento una barra de busqueda para acortar el proceso de busqueda.
##### enviarPedido()

Este metodo nos permite crear un pedido al endpoint api/pedidos, a partir del arreglo de platillos que fueron seleccionados durante el proceso.

<img width="1916" height="866" alt="Screenshot 2025-07-29 090432" src="https://github.com/user-attachments/assets/947c3469-0b35-4b5a-b0a8-9067e16c9b33" />

### Visualizacion de aprobacion de pedidos
En esta vista, visualizamos todos los pedidos tomados y podemos actualizar su estado de acuerdo a los movimientos que ocurran en el proceso del restaurante.
Podemos cambiar su estado de pendiente, a entregado, a pagado.
Visualizamos la lista de pedidos en una tabla paginada, acompañada de una serie de radio button para filtrar los pedidos de acuerdo a su estado, para esto hacemos llamada al endpoint api/pedidos, esto lo logramos con obtenerPedidos() en el administracion-ordenes.ts

<img width="1868" height="786" alt="Screenshot 2025-07-30 020209" src="https://github.com/user-attachments/assets/9b297ed2-f69b-4f94-9d4c-8ca9468c1691" />

#### Formulario de pago
En nuestro formulario pago, contamos con un formulario para capturar los datos de pago del usuario. Se valida que los campos contengan el tipo de caracter apropiado para el tipo de dato que se esta administrando. 
Si se cumplen el rellenado de los campos, podemos entonces elegir un metodo de envio de ticket, impreso o enviado por email.  Una vez seleccionado uno de ellos podemos desbloquear el boton pagar que iniciara el evento para resolver el metodo de envio del ticket.
Para cumplir esto se implemento un metodo de nombre pagar(), donde hacemos llamadas al endpoint con el body correspondiente de acuerdo al metodo de envio. 

<img width="650" height="868" alt="Screenshot 2025-07-30 020233" src="https://github.com/user-attachments/assets/778422ca-8b95-450d-ab54-38521e379c6a" />

### Visualizacion de edicion de usuarios

En esta vista podemos visualizar a los usuarios que existen dentro del sistema. En nuestro sistema de roles contamos con roles como: admin, comensal y mesero.

En esta vista podemos tambien disponer de metodos como crearEmpleado, guardarUsuario, eliminarUsuario y obtenerUsuarios().
Para todos estos metodos, empleamos llamadas al api/usuarios, la cual requiere de un token de autentificacion como parte del header, por motivos de seguridad e integridad.
Se cuenta con alertas de seguridad para confirmar cambios como ediciones o eliminaciones de datos de los usuarios.

<img width="1899" height="847" alt="Screenshot 2025-07-30 020413" src="https://github.com/user-attachments/assets/1f4a6214-eb2c-4575-8474-e2259f748096" />

### Visualizacion de edicion de menus

En esta vista podemos visualizar en una tabla el contenido del menu. En nuestro typescript tenemos metodos como obtenerPlatillo(), guardarPlatillo(), eliminarPlatillo(), crearPlatillo().
obtenerPlatillo() hace una llamada al endpoint /api/productos que nos permite rellenar de datos la tabla.
eliminarPlatillo() es una llamada que inicia al ser oprimido el boton eliminar, que hace una llamada al endpoint api/productos/idproducto
crearPlatillo() hace una llamada al api cuando se hace clic en crear platillo, donde con un formulario podemos añadir mas elementos al menu.

<img width="1914" height="754" alt="Screenshot 2025-07-30 020527" src="https://github.com/user-attachments/assets/e6b9a765-012b-4e3d-ad0c-7ebb2ef27399" />


#### Proceso Principal 

[ "El mesero toma un pedido desde la mesa, añade productos, y el pedido se envía a cocina. El admin tambien como el mesero puede ver el estado de  pedido y confirmar o cobrar. El admin es el unico que puede eliminar o desactivar usuarios o cancelar pedidos"]

# 4. Dependencias y configuraciones.

Para realizar el proyecto frontend, empleamos angular y bibliotecas como bootstrap 5.
<img width="1707" height="960" alt="7da461bb-34d8-4fa8-8bb2-138f6f7034d8-cover-879652240" src="https://github.com/user-attachments/assets/04c42701-ce33-4463-a015-6b8fa21e1948" />

Bootstrap es un framework CSS de código abierto que facilita el desarrollo de sitios web responsivos y adaptables a dispositivos móviles. Creado por Twitter, Bootstrap proporciona una colección de componentes, estilos y utilidades que aceleran el desarrollo web.

![AngularJS-Overview-1414167808](https://github.com/user-attachments/assets/ee5b314b-e5b3-4a1c-ae41-d4aa9769bc7b)
Angular es un framework de diseño de aplicaciones y plataforma de desarrollo para crear aplicaciones de una sola página eficientes y sofisticadas

Esta documentación de Angular te ayuda a aprender y usar el framework y la plataforma de desarrollo, desde tu primera aplicación hasta la optimización de aplicaciones complejas de una sola página, para empresas. Los tutoriales y guías incluyen ejemplos descargables para acelerar tus proyectos.



