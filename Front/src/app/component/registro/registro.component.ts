import { Component, OnInit, ViewEncapsulation } from '@angular/core';
/* -----------------Interfaces -------------------------*/
import { ILocalidad } from '../../models/Ilocalidad';
import { IPais } from '../../models/Ipais';
import { IProvincia } from '../../models/Iprovincia';
import { InewUser } from 'src/app/models/inew-user';
import { Imonto } from 'src/app/models/saldo';

/* -----------------Servicios -------------------------*/
import { LocalidadService } from '../../service/localidad.service';
import { PaisService } from '../../service/pais.service';
import { ProvinciaService } from '../../service/provincia.service';
import { SaldoService } from '../../service/saldo.service';
import { UserService } from '../../service/user.service';
import { GetUserService } from '../../service/get-user.service';
/* -----------------Imports para porgramacioon reactiva -------------------------*/
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
/* -----------------Ruteo -------------------------*/
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css'],
  encapsulation: ViewEncapsulation.None,
})
export class RegistroComponent implements OnInit {
  selectedPais: IPais = { idPais: 0, nombre: '' };
  selectedProvincia: IProvincia = { idProvincia: 0, nombre: '', idPais: 0 };
  localidades: ILocalidad[];
  paises: IPais[];
  provincias: IProvincia[];
  returnUrl: string;
  tiempo: number;
  monto: Imonto;

  singUpForm: FormGroup;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private builder: FormBuilder,
    private localidadService: LocalidadService,
    private paisService: PaisService,
    private provinciaService: ProvinciaService,
    private userService: UserService,
    private getUserService: GetUserService,
    private saldoService: SaldoService
  ) {
    this.singUpForm = this.builder.group({
      dni: ['', Validators.required],
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      alias: ['', Validators.required],
      telefono: ['', Validators.required],
      email: ['', Validators.compose([Validators.email, Validators.required])],
      nomUsuario: ['', Validators.required],
      password: ['', Validators.required],
      idProvincia: [Validators.required],
      idLocalidad: [Validators.required],
      idPais: [Validators.required],

      calle: ['', Validators.required],
      altura: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.returnUrl = this.route.snapshot.queryParams.returnUrl || '/';
    /* -----------------Traemos los paices -------------------------*/
    this.paisService.getAll().subscribe(
      (paisesFromApi: IPais[]) => {
        this.paises = paisesFromApi;
      },
      (error) => console.error(error)
    );
  }
  /* -----------------Traemos las provincias segun el pais elegido -------------------------*/
  onSelectPais(id: number): void {
    this.provinciaService.getPorPais(id).subscribe(
      (provinciasFromApi: IProvincia[]) => {
        this.provincias = provinciasFromApi;
      },
      (error) => console.error(error)
    );
  }
  /* -----------------Traemos las localidades segun la provincia elegida -------------------------*/
  onSelectProvincia(id: number): void {
    console.log(id);
    this.localidadService.getPorProvincia(id).subscribe(
      (localidadesFromApi: ILocalidad[]) => {
        this.localidades = localidadesFromApi;
        console.log(this.localidades);
      },
      (error) => console.error(error)
    );
  }
  /* ----------------- Inicializamos una cuenta saldo y logeamos a usuario nuevo -------------------------*/
  onSubmit(value: InewUser): void {
    this.monto = {
      monto: 0,
    };
    this.tiempo = 5000;

    this.userService.addNewUser(value).subscribe((user) => {
      this.router.navigate([this.returnUrl]);
    });
    setTimeout(() => {
      this.saldoService
        .newSaldo(value.nomUsuario, this.monto)
        .subscribe((saldo) => console.log());
    }, this.tiempo);
  }
}
