import { RouterModule } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpHeaders } from '@angular/common/http';
import { BarraNavegacion } from "../barra-navegacion/barra-navegacion";

@Component({
  selector: 'app-crud-productos',
  imports: [RouterModule, CommonModule, HttpClientModule, FormsModule, BarraNavegacion],
  templateUrl: './crud-productos.html',
  styleUrl: './crud-productos.css'
})
export class CrudProductos implements OnInit {

  nuevoPlatillo = {
    nombre: '',
    descripcion: '',
    precio: 0
  };
  platillos: any[] = [];
  constructor(private http: HttpClient, private cdRef: ChangeDetectorRef) {}

  mostrarFormulario = false;

  toggleFormulario(): void {
    this.mostrarFormulario = !this.mostrarFormulario;
  }
  ngOnInit(): void {
    this.obtenerPlatillos();
  }

  obtenerPlatillos(): void {
    this.http.get<any[]>('http://172.20.10.2:8000/api/API/productos/')
      .subscribe({
        next: datos => {
          this.platillos = datos.map(p => ({ ...p, editando: false }));
          this.cdRef.detectChanges();
        },
        error: err => {
          console.error('Error al cargar los platillos:', err);
        }
      });
  }

  editarPlatillo(index: number): void {
    this.platillos[index].editando = true;
  }

  guardarPlatillo(index: number): void {
    const platillo = this.platillos[index];
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
    'Authorization': `Bearer ${token}`
    });

    console.log('Enviando PUT a API con ID:', platillo.id);
    console.log('Datos enviados:', platillo);
    
  
    this.http.put(`http://172.20.10.2:8000/api/productos/${platillo.id}`, platillo, { headers }).subscribe({
      next: () => {
        platillo.editando = false;
        this.cdRef.detectChanges();
        alert('Se modificó el registro');
      },
      error: err => {
      console.error('Error al guardar cambios:', err);
      }
      });
    }

  eliminarPlatillo(id: number): void {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
        'Authorization': `Bearer ${token}`
      });
    this.http.delete(`http://172.20.10.2:8000/api/productos/${id}`, { headers }).subscribe({      next: () => {
         this.obtenerPlatillos();
      },
    error: err => {
        console.error('Error al eliminar platillo:', err);
      }
    });
  }

  crearPlatillo(): void {
    const token = localStorage.getItem('token');
    const headers = {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    };
    console.log('Enviando:', this.nuevoPlatillo);
    this.http.post('http://172.20.10.2:8000/api/productos', this.nuevoPlatillo, { headers }).subscribe({
      next: (res) => {
        console.log('Platillo creado:', res);
        this.obtenerPlatillos(); 
        this.nuevoPlatillo = { nombre: '', descripcion: '', precio: 0 }; 
      },
      error: (err) => {
        console.error('Error al crear platillo:', err);
      }
    });
  }
}
