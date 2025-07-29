import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BarraNavegacion } from "../barra-navegacion/barra-navegacion";
import { HttpHeaders } from '@angular/common/http';

declare const bootstrap: any;
@Component({
  selector: 'app-pedidos',
  imports: [RouterModule, CommonModule, HttpClientModule, FormsModule, BarraNavegacion],
  templateUrl: './pedidos.html',
  styleUrl: './pedidos.css'
})
export class Pedidos implements OnInit {
  mesas: any[] = [];
  pedidos: any[] = [];
  mostrarResumen = false;
terminoBusqueda: string = '';
platillosFiltrados: any[] = []; 
numeroMesa: number = 0;

  nuevoPlatillo = {
    nombre: '',
    descripcion: '',
    precio: 0
  };
  platillos: any[] = [];
  constructor(private http: HttpClient, private cdRef: ChangeDetectorRef) {}

  ngOnInit(): void {
    this.obtenerPlatillos();
  this.obtenerMesas();
  }
  

obtenerMesas(): void {
  const token = localStorage.getItem('token'); // o de donde guardes el token
  const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);

  this.http.get<any[]>('http://172.20.10.2:8000/api/mesas/', { headers })
    .subscribe({
      next: datos => {
        this.mesas = datos;
      },
      error: err => {
        console.error('Error al cargar las mesas:', err);
      }
    });
}

  obtenerPlatillos(): void {
  this.http.get<any[]>('http://172.20.10.2:8000/api/API/productos/')
    .subscribe({
      next: datos => {
        this.platillos = datos.map(p => ({ ...p, editando: false }));
        this.platillosFiltrados = [...this.platillos]; // 🔄 Copia los datos para el filtro
        this.cdRef.detectChanges();
      },
      error: err => {
        console.error('Error al cargar los platillos:', err);
      }
    });
}
  eliminarPlatillo(index: number){

  }
  agregarPlatillo(id: number): void {
  const platillo = this.platillos.find(p => p.id === id);

  if (!platillo || !platillo.cantidad || platillo.cantidad < 1) {
    alert('Debe ingresar una cantidad válida para el platillo');
    return;
  }
  console.log(platillo);
  const existente = this.pedidos.find(p => p.id === platillo.id);

  if (existente) {
    existente.cantidad += platillo.cantidad;
  } else {
    this.pedidos.push({
      id: platillo.id,
      nombre: platillo.nombre,
      descripcion: platillo.descripcion,
      precio: platillo.precio,
      cantidad: platillo.cantidad
    });
  }

  platillo.cantidad = null;
}

  filtrarPlatillos(): void {
  const termino = this.terminoBusqueda.toLowerCase().trim();
  this.platillosFiltrados = this.platillos.filter(p =>
    p.nombre.toLowerCase().includes(termino)
  );
}
  

visualizarPedido() {
 console.log(this.pedidos);
  const modalElement = document.getElementById('modalResumen');
  if (modalElement) {
    const modal = new bootstrap.Modal(modalElement);
    modal.show();
  }
}
obtenerTotal(): number {
  return this.pedidos.reduce((total, p) => total + p.precio * p.cantidad, 0);
}

enviarPedido() {
  if (!this.numeroMesa || this.numeroMesa <= 0) {
    alert('Por favor, ingrese un número de mesa válido');
    return;
  }

  if (this.pedidos.length === 0) {
    alert('No hay productos en el pedido');
    return;
  }

  const pedido = {
    mesa_id: this.numeroMesa,
    items: this.pedidos.map(p => ({
      producto_id: p.id,
      cantidad: p.cantidad
    }))
  };

  console.log('Pedido a enviar:', JSON.stringify(pedido));

  const token = localStorage.getItem('token');
  const headers = new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`
  });

  this.http.post('http://172.20.10.2:8000/api/pedidos/', pedido, { headers })
    .subscribe({
      next: (response) => {
        console.log('Pedido enviado con éxito:', response);
        alert('¡Pedido enviado!');
        this.pedidos = [];
        this.numeroMesa = 0;
      },
      error: (error) => {
        console.error('Error al enviar el pedido:', error);
        alert('Error al enviar el pedido');
      }
    });
}

  

}
