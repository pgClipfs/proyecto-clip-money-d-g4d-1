import { Component, OnInit } from '@angular/core';
import { Localidad } from '../../models/localidad';
import { Pais } from '../../models/pais';
import { Provincia } from '../../models/provincia';
import { LocalidadService } from '../../service/localidad.service';
import { PaisService } from '../../service/pais.service';
import { ProvinciaService } from '../../service/provincia.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css'],
})
export class RegistroComponent implements OnInit {
  selectedPais: Pais = { idPais: 0, nombre: '' };
  selectedProvincia: Provincia = { idProvincia: 0, nombre: '', idPais: 0 };
  localidades: Localidad[];
  paises: Pais[];
  provincias: Provincia[];

  constructor(
    private localidadService: LocalidadService,
    private paisService: PaisService,
    private provinciaService: ProvinciaService
  ) {}

  ngOnInit(): void {
    this.paisService.getAll().subscribe(
      (paisesFromApi: Pais[]) => {
        this.paises = paisesFromApi;
      },
      (error) => console.error(error)
    );
  }
  onSelectPais(id: number): void {
    this.provinciaService.getPorPais(id).subscribe(
      (provinciasFromApi: Provincia[]) => {
        this.provincias = provinciasFromApi;
      },
      (error) => console.error(error)
    );
  }
  onSelectProvincia(id: number): void {
    console.log(id);
    this.localidadService.getPorProvincia(id).subscribe(
      (localidadesFromApi: Localidad[]) => {
        this.localidades = localidadesFromApi;
        console.log(this.localidades);
      },
      (error) => console.error(error)
    );
  }
}
