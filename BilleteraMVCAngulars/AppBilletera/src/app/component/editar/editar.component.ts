import { Component, OnInit } from '@angular/core';
import { ILocalidad } from '../../models/Ilocalidad';
import { IPais } from '../../models/Ipais';
import { IProvincia } from '../../models/Iprovincia';
import { LocalidadService } from '../../service/localidad.service';
import { PaisService } from '../../service/pais.service';
import { ProvinciaService } from '../../service/provincia.service';
import { GetUserService } from '../../service/get-user.service';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { UserService } from '../../service/user.service';
import { InewUser } from 'src/app/models/inew-user';
import { IgetUser } from 'src/app/models/userget';

import * as bcrypt from 'bcryptjs';

@Component({
  selector: 'app-editar',
  templateUrl: './editar.component.html',
  styleUrls: ['./editar.component.css'],
})
export class EditarComponent implements OnInit {
  selectedPais: IPais = { idPais: 0, nombre: '' };
  selectedProvincia: IProvincia = { idProvincia: 0, nombre: '', idPais: 0 };
  localidades: ILocalidad[];
  paises: IPais[];
  provincias: IProvincia[];
  returnUrl: string;
  user: IgetUser = {
    id: 1,
    firstName: 'string',
    lastName: 'string',
    dni: 1,
    telefono: 1,
    email: 'string',
    userName: 'string',
    password: 'string',
    pais: 1,
    provincia: 1,
    localidad: 1,
    calle: 'h',
    altura: 1,
  };

  singUpForm: FormGroup;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private builder: FormBuilder,
    private localidadService: LocalidadService,
    private paisService: PaisService,
    private provinciaService: ProvinciaService,
    private userService: UserService,
    private getUserService: GetUserService
  ) {
    this.singUpForm = this.builder.group({
      dni: ['', Validators.required],
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],

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
    this.paisService.getAll().subscribe(
      (paisesFromApi: IPais[]) => {
        this.paises = paisesFromApi;
      },
      (error) => console.error(error)
    );

    this.getUserService.getUser(2007).subscribe(
      (userFromApi: IgetUser) => {
        this.user = userFromApi;
        console.log(this.user);
      },
      (error) => console.error(error)
    );
  }
  onSelectPais(id: number): void {
    this.provinciaService.getPorPais(id).subscribe(
      (provinciasFromApi: IProvincia[]) => {
        this.provincias = provinciasFromApi;
      },
      (error) => console.error(error)
    );
  }
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
  onSubmit(value: InewUser): void {
    this.userService.addNewUser(value).subscribe((user) => {
      this.router.navigate([this.returnUrl]);
    });
  }
}
