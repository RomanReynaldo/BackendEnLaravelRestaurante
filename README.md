
# 1. "Sistema de Gestion de servicios de Restaurante: Frontned"


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

### Proceso de Logueo

En esta interfaz, con el uso de dos inputs, uno de correo y otro contraseña. Esta vista esta diseñada para validar las credenciales de usuarios con roles como mesero o administrador, para poder desempeñar sus tareas en el restaurante.

Interfaz de login <img width="1910" height="880" alt="Screenshot 2025-07-29 081349" src="https://github.com/user-attachments/assets/f574c231-322c-4e17-938e-226339bc5c7e" />

#### Recuperacion de contraseñas


### Visualizacion de menus

Se incorporo un buscador para navegar el menu y paginacion a las tarjetas de platillos. 

<img width="1913" height="884" alt="Screenshot 2025-07-29 090407" src="https://github.com/user-attachments/assets/eed4b0b1-f05e-48e4-8591-e20885e96630" />

<img width="1913" height="805" alt="Screenshot 2025-07-29 090420" src="https://github.com/user-attachments/assets/38fb5de1-f226-42c7-b6a0-22d7b71db437" />

### Visualizacion de orden de pedidos
En esta vista el mesero y administrador, pueden tomar pedidos de los clientes, seleccionarlos de la lista, con la ayuda de un buscador y los añadimos al 

<img width="1916" height="866" alt="Screenshot 2025-07-29 090432" src="https://github.com/user-attachments/assets/947c3469-0b35-4b5a-b0a8-9067e16c9b33" />

### Visualizacion de aprobacion de pedidos
<img width="1868" height="786" alt="Screenshot 2025-07-30 020209" src="https://github.com/user-attachments/assets/9b297ed2-f69b-4f94-9d4c-8ca9468c1691" />

#### Formulario de pago
<img width="650" height="868" alt="Screenshot 2025-07-30 020233" src="https://github.com/user-attachments/assets/778422ca-8b95-450d-ab54-38521e379c6a" />

### Visualizacion de edicion de usuarios
<img width="1899" height="847" alt="Screenshot 2025-07-30 020413" src="https://github.com/user-attachments/assets/1f4a6214-eb2c-4575-8474-e2259f748096" />

### Visualizacion de edicion de menus
<img width="1914" height="754" alt="Screenshot 2025-07-30 020527" src="https://github.com/user-attachments/assets/e6b9a765-012b-4e3d-ad0c-7ebb2ef27399" />

### Visualizacion del dashboard
<img width="1898" height="789" alt="Screenshot 2025-07-30 020547" src="https://github.com/user-attachments/assets/c5c30242-bc94-4073-897a-d304e0bb1568" />

### Barra de navegacion
<img width="1899" height="99" alt="Screenshot 2025-07-30 020557" src="https://github.com/user-attachments/assets/8afd4adc-4539-405a-922e-09119ce3be61" />


#### Proceso Principal 

[ "El mesero toma un pedido desde la mesa, añade productos, y el pedido se envía a cocina. El admin tambien como el mesero puede ver el estado de  pedido y confirmar o cobrar. El admin es el unico que puede eliminar o desactivar usuarios o cancelar pedidos"]

![de roles y permisos](/images/crudPedidosPDF.png)

