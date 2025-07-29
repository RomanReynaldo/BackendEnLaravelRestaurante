import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdministracionOrdenes } from './administracion-ordenes';

describe('AdministracionOrdenes', () => {
  let component: AdministracionOrdenes;
  let fixture: ComponentFixture<AdministracionOrdenes>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AdministracionOrdenes]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AdministracionOrdenes);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
