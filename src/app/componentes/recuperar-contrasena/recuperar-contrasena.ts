import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Router } from '@angular/router';
import { ChangeDetectorRef } from '@angular/core';
@Component({
  selector: 'app-recuperar-contrasena',
  imports: [FormsModule, CommonModule,HttpClientModule, RouterModule],
  templateUrl: './recuperar-contrasena.html',
  styleUrl: './recuperar-contrasena.css'
})
export class RecuperarContrasena {
  email: string = '';
  password: string = '';
  passwordVisible = false;
  

    constructor(private http: HttpClient, private cdRef: ChangeDetectorRef, private router: Router) {}
 togglePasswordVisibility() {
    this.passwordVisible = !this.passwordVisible; 
  }
  onSubmit() {
       const payload = { email: this.email };

    this.http.post('http://172.20.10.2:8000/api/password/email/', payload).subscribe({
      next: response => {
        alert('📨 Se ha enviado un correo de recuperación. Revisa tu bandeja de entrada.');
        console.log('Respuesta:', response);
      },
      error: error => {
        alert('❌ No se pudo enviar el correo. Verifica el email ingresado.');
        console.error('Error:', error);
      }
    });
  }

}
