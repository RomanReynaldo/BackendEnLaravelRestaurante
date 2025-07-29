import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BarraNavegacion } from "../barra-navegacion/barra-navegacion";
import { HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';


@Component({
  selector: 'app-administracion-ordenes',
  imports: [RouterModule, CommonModule, HttpClientModule, FormsModule, BarraNavegacion],
  templateUrl: './administracion-ordenes.html',
  styleUrl: './administracion-ordenes.css'
})
export class AdministracionOrdenes implements OnInit {

  pedidos: any[] = [];
  paginatedPedidos: any[] = [];
currentPage: number = 1;
itemsPerPage: number = 6;
totalPages: number = 1;
rol: string = 'mesero'; // o 'admin', según corresponda

  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit(): void {
    this.obtenerPedidos(); // ⬅️ Asegúrate de llamar este método aquí
  }

  obtenerPedidos() {
    this.rol = localStorage.getItem('rol') || 'mesero';
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);

    this.http.get<any[]>('http://172.20.10.2:8000/api/pedidos', { headers })
      .subscribe({
        next: (data) => {
          this.totalPages = Math.ceil(this.pedidos.length / this.itemsPerPage);
        this.updatePaginatedPedidos();
          this.pedidos = data;
        },
        error: (err) => {
          console.error('Error al obtener pedidos:', err);
        }
      });
  }
  updatePaginatedPedidos() {
  const start = (this.currentPage - 1) * this.itemsPerPage;
  const end = start + this.itemsPerPage;
  this.paginatedPedidos = this.pedidos.slice(start, end);
}

nextPage() {
  if (this.currentPage < this.totalPages) {
    this.currentPage++;
    this.updatePaginatedPedidos();
  }
}

prevPage() {
  if (this.currentPage > 1) {
    this.currentPage--;
    this.updatePaginatedPedidos();
  }
}
accionPedido(pedido: any) {
  if (pedido.estado === 'pendiente') {/*Primera condicional*/ 
  console.log('Cambiando estado a entregado');

  const token = localStorage.getItem('token');
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };

  this.http.put(`http://172.20.10.2:8000/api/pedidos/${pedido.id}`, 
    { estado: 'entregado' }, 
    { headers }
  ).subscribe({
    next: (response) => {
      console.log('Pedido actualizado:', response);
      // Actualiza el estado local para reflejar el cambio en la UI
      pedido.estado = 'entregado';
    },
    error: (err) => {
      console.error('Error al actualizar el pedido:', err);
    }
  });
} else if (pedido.estado === 'entregado') {/*segunda condicional*/ 
     console.log('Actualizando mesa a disponible y cambiando estado a pagado');
    const token = localStorage.getItem('token');
    const headers = {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    };

     this.http.put(`http://172.20.10.2:8000/api/mesas/${pedido.mesa_id}`, 
    { estado: 'disponible' }, 
    { headers }
  ).subscribe({
    next: (mesaResponse) => {
      console.log('Mesa actualizada a disponible:', mesaResponse);
      this.router.navigate(['/pago']); 
    },
    error: (mesaError) => {
      console.error('Error al actualizar la mesa:', mesaError);
    }
  });

  } else if (pedido.estado === 'pagado' && this.rol === 'admin') {/*tercera condicional*/ 

  }
}

}