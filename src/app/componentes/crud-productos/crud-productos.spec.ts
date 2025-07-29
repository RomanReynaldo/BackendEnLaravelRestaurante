import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CrudProductos } from './crud-productos';

describe('CrudProductos', () => {
  let component: CrudProductos;
  let fixture: ComponentFixture<CrudProductos>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CrudProductos]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CrudProductos);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
