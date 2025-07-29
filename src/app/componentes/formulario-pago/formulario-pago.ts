import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http'; 
import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http'; // Importa HttpResponse
import { Router } from '@angular/router'; // Para la redirección
import { ActivatedRoute } from '@angular/router'; // Descomentar si vas a obtener pedidoId de la ruta

// !!! RUTA DE IMPORTACIÓN DEL ENTORNO !!!
// Ajusta esta ruta si tu archivo 'environment.ts' no está exactamente en 'src/environments/'
// Por ejemplo, si tu componente está en 'src/app/mi-modulo/componentes/formulario-pago/'
// podrías necesitar más '../' como '../../../../../environments/environment'
//import { environment } from '../../../environments/environment'; // Esta es la ruta más común si tu componente está anidado.


@Component({
  selector: 'app-formulario-pago',
  standalone: true, // Si estás en Angular 14+ y es un componente standalone.
                     // Si no estás usando 'standalone', quita esta línea
                     // y asegúrate de que este componente esté declarado
                     // en un NgModule (ej. AppModule) y que FormsModule, CommonModule
                     // y HttpClientModule estén en los 'imports' de ese NgModule.
  imports: [
    FormsModule,     // Necesario para el two-way data binding con ngModel en el HTML
    CommonModule ,    // Necesario para directivas comunes de Angular como ngFor, ngIf
    HttpClientModule //NO se importa aquí. Se importa una única vez en tu AppModule o módulo raíz.

  ],
  templateUrl: './formulario-pago.html',
  styleUrl: './formulario-pago.css'
})
export class FormularioPago {

  meses = [
    { value: '01', name: '01 - Ene' },
    { value: '02', name: '02 - Feb' },
    { value: '03', name: '03 - Mar' },
    { value: '04', name: '04 - Abr' },
    { value: '05', name: '05 - May' },
    { value: '06', name: '06 - Jun' },
    { value: '07', name: '07 - Jul' },
    { value: '08', name: '08 - Ago' },
    { value: '09', name: '09 - Sep' },
    { value: '10', name: '10 - Oct' },
    { value: '11', name: '11 - Nov' },
    { value: '12', name: '12 - Dic' },
  ];

  anios: number[] = [];
  numeroTarjeta = ''; // Usado con ngModel en el HTML para el campo del número de tarjeta

  // --- Propiedad para el ID del pedido ---
  // IMPORTANTE: En una aplicación real, este valor NO debe ser fijo.
  // Debe ser obtenido dinámicamente, por ejemplo:
  // - A través de un @Input() si el componente se usa dentro de otro.
  // - De los parámetros de la URL (si la ruta es /pago/:id).
  // - De un servicio que maneje el estado del pedido.
  pedidoId: number = 4; // <-- ¡¡CAMBIA ESTE VALOR!! O hazlo dinámico.

  constructor(
    private http: HttpClient, // Inyección del servicio HttpClient para hacer peticiones HTTP
    private router: Router    // Inyección del servicio Router para navegación
    // private route: ActivatedRoute // Descomentar si vas a usar ActivatedRoute para obtener el ID de la URL
  ) {
    // Inicializa el array de años para el selector (dropdown) de la fecha de expiración
    const añoActual = new Date().getFullYear();
    for (let i = 0; i < 10; i++) {
      this.anios.push(añoActual + i);
    }

    // EJEMPLO: Cómo podrías obtener el pedidoId de la URL si tu ruta es /pago/:id
    /*
    this.route.paramMap.subscribe(params => {
      const idParam = params.get('id');
      if (idParam) {
        this.pedidoId = Number(idParam); // Convierte el parámetro de string a número
        if (isNaN(this.pedidoId)) {
          console.error('ID de pedido inválido en la URL.');
          alert('ID de pedido no válido. Por favor, verifica la URL.');
          // Puedes redirigir o deshabilitar el formulario si el ID es inválido
        }
      } else {
        console.error('ID de pedido no encontrado en la URL.');
        alert('No se encontró un ID de pedido en la URL.');
      }
    });
    */
  }

  /**
   * Método para procesar el pago y solicitar el ticket en formato PDF.
   */
  pagar(): void {
    // --- Validaciones iniciales ---
    if (this.pedidoId === null || isNaN(this.pedidoId)) {
      console.error('Error: ID de pedido no disponible o inválido para procesar el pago.');
      alert('No se pudo procesar el pago: ID de pedido no encontrado o incorrecto.');
      return; // Detiene la ejecución si no hay un ID de pedido válido
    }

    // Obtener el token de autenticación del almacenamiento local del navegador
    const token = localStorage.getItem('token');
    if (!token) {
        console.error('Error: Token de autenticación no encontrado. El usuario no está logueado.');
        alert('Necesitas iniciar sesión para realizar un pago. Redirigiendo al login...');
        this.router.navigate(['/login']); // Redirige al login si no hay token
        return;
    }

    // --- Configuración de los encabezados HTTP ---
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`,        // Token de autorización para la API
      'Content-Type': 'application/json',       // Indicamos que el cuerpo que ENVIAMOS es JSON
      'Accept': 'application/pdf'               // Le decimos al servidor que ESPERAMOS un PDF como respuesta
    });

    // --- Cuerpo de la petición PUT ---
    // Datos que se envían al backend para actualizar el estado del pedido y solicitar el ticket
    const body = {
      estado: 'pagado',                 // Actualiza el estado del pedido a 'pagado'
      metodo_envio_ticket: 'descargar'  // Indica al backend que genere y devuelva el PDF para descarga
      // Aquí podrías añadir otros datos del formulario de pago si tu API los espera (ej. mes, año, CVC)
      // Pero NUNCA envíes información sensible de tarjeta de crédito directamente a tu backend si no la estás tokenizando con un PSP.
    };

    // --- Realizar la petición HTTP PUT al backend ---
    this.http.put(`http://127.0.0.1:8000/api/pedidos/${this.pedidoId}`, body, {
      headers,                  // Aplicar los encabezados definidos
      responseType: 'blob',     // ¡¡CRUCIAL!! Esperamos que la respuesta del servidor sea un Blob (datos binarios)
      observe: 'response'       // Esto nos permite acceder al objeto HttpResponse completo (incluyendo los headers de la respuesta)
    })
    .subscribe({
      // --- Bloque 'next': Se ejecuta cuando la petición es exitosa (2xx status code) ---
      next: (response: HttpResponse<Blob>) => { // La respuesta es un objeto HttpResponse<Blob>
        const contentType = response.headers.get('Content-Type'); // Obtener el Content-Type de la respuesta

        // Verificar si la respuesta es realmente un PDF
        if (contentType && contentType.includes('application/pdf')) {
          const blob = response.body; // El cuerpo de la respuesta es el Blob (nuestro PDF)

          // Intentar obtener el nombre del archivo del encabezado 'Content-Disposition'
          // Si el servidor envía: Content-Disposition: attachment; filename="ticket_pedido_4.pdf"
          const contentDisposition = response.headers.get('Content-Disposition');
          let filename = `ticket_pedido_${this.pedidoId}.pdf`; // Nombre de archivo por defecto
          if (contentDisposition) {
            const matches = /filename="([^"]+)"/g.exec(contentDisposition); // Buscar el nombre entre comillas
            if (matches && matches[1]) {
              filename = matches[1].replace(/"/g, ''); // Limpiar posibles comillas dobles
            }
          }

          // Si el Blob existe y no es nulo, proceder con la descarga
          if (blob) {
            // 1. Crear una URL temporal para el Blob en el navegador
            const url = window.URL.createObjectURL(blob);

            // 2. Crear un elemento <a> (enlace HTML) temporal en el DOM
            const a = document.createElement('a');
            a.href = url;              // Asignar la URL temporal al atributo href
            a.download = filename;     // Establecer el nombre de archivo sugerido para la descarga

            // 3. Añadir el elemento <a> al cuerpo del documento y simular un clic
            //    Esto dispara el diálogo de descarga en el navegador
            document.body.appendChild(a); // Es buena práctica añadirlo al DOM antes de hacer clic (especialmente para Firefox)
            a.click();                    // Simular un clic programático en el enlace

            // 4. Limpiar: remover el elemento <a> del DOM y liberar la URL temporal
            document.body.removeChild(a); // Eliminar el elemento <a> creado
            window.URL.revokeObjectURL(url); // Liberar la memoria de la URL del Blob

            console.log('Pago exitoso y PDF descargado con éxito.');
            alert('¡Pago procesado y ticket descargado!'); // Usar un servicio de notificaciones más avanzado en producción
            this.router.navigate(['/admiOrden']); // Redirigir a una página de confirmación

          } else {
            // El Blob es nulo, lo cual no debería pasar si el Content-Type es PDF
            console.error('Error: El cuerpo de la respuesta es nulo a pesar de ser un PDF esperado.');
            alert('Error al descargar el ticket: Contenido del PDF vacío.');
          }

        } else {
          // --- Bloque 'else': Se ejecuta si la respuesta NO es un PDF (ej. un JSON de error) ---
          const blobError = response.body; // El cuerpo de la respuesta sigue siendo un Blob aquí
          if (blobError) {
            const reader = new FileReader(); // Usar FileReader para leer el Blob como texto
            reader.onload = () => {
              const text = reader.result as string; // El resultado es el texto del Blob

              try {
                const errorBody = JSON.parse(text); // Intentar parsear el texto a JSON
                console.error('Error del servidor (JSON):', errorBody);
                alert(`Error en el pago: ${errorBody.message || 'Error desconocido del servidor.'}`);
              } catch (e) {
                console.error('Respuesta inesperada del servidor (no es PDF ni JSON):', text);
                alert('Ocurrió un error inesperado al procesar el pago. El servidor no envió un PDF ni un error JSON válido.');
              }
            };
            reader.readAsText(blobError); // Iniciar la lectura del Blob como texto
          } else {
            console.error('Error: La respuesta no fue un PDF y el cuerpo es nulo.');
            alert('Ocurrió un error inesperado. El servidor no envió una respuesta válida.');
          }
        }
      },
      // --- Bloque 'error': Se ejecuta si hay un error en la petición HTTP (ej. 4xx, 5xx, error de red) ---
      error: error => {
        console.error('Error en la petición HTTP:', error);
        // Manejo de errores más amigable para el usuario
        if (error.status === 0) {
          // Status 0 suele indicar un problema de red, CORS, o que el servidor no está accesible/respondiendo.
          alert('No se pudo conectar con el servidor. Por favor, verifica tu conexión a internet o el estado de la API.');
        } else if (error.error && typeof error.error === 'object' && error.error.message) {
          // Si el error es un objeto con un mensaje (común en errores de validación de Laravel, etc.)
          alert(`Error en el pago: ${error.error.message}`);
        } else {
          // Error genérico no cubierto
          alert('Ocurrió un error desconocido al procesar el pago. Por favor, inténtalo de nuevo.');
        }
      }
    });
  }

  /**
   * Método para formatear el número de tarjeta de crédito/débito mientras se escribe.
   * Inserta espacios cada 4 dígitos.
   */
  formatearTarjeta(event: Event) {
    const input = event.target as HTMLInputElement;
    // Eliminar todo lo que no sea dígito
    let valor = input.value.replace(/\D/g, '');

    // Limitar a 16 dígitos (o el máximo que tu sistema acepte, ej. 19 para Amex)
    valor = valor.substring(0, 16);

    // Insertar un espacio cada 4 dígitos
    const bloques = valor.match(/.{1,4}/g); // Encuentra secuencias de 1 a 4 dígitos
    if (bloques) {
      valor = bloques.join(' '); // Une los bloques con espacios
    }

    this.numeroTarjeta = valor; // Actualiza la propiedad del componente (para ngModel)
    input.value = valor;       // Actualiza el valor directamente en el input (para la vista inmediata)
  }
}