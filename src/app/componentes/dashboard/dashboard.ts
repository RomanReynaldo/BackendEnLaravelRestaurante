import { Component } from '@angular/core';
import { BarraNavegacion } from "../barra-navegacion/barra-navegacion";

@Component({
  selector: 'app-dashboard',
  imports: [BarraNavegacion],
  templateUrl: './dashboard.html',
  styleUrl: './dashboard.css'
})
export class Dashboard {

}
