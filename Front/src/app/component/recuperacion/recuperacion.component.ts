import { Component, OnInit } from '@angular/core';
import { Ipassword } from '../../models/inew-user';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { RecuperarContraseñaService } from '../../service/recuperar-contraseña.service';

@Component({
  selector: 'app-recuperacion',
  templateUrl: './recuperacion.component.html',
  styleUrls: ['./recuperacion.component.css'],
})
export class RecuperacionComponent implements OnInit {
  upRecuContra: FormGroup;
  token: string;
  returnUrl: string;
  constructor(
    private builder: FormBuilder,
    private activatedRoute: ActivatedRoute,
    private router: Router,

    private reuContraService: RecuperarContraseñaService
  ) {
    this.upRecuContra = this.builder.group({
      password: ['', Validators.required],
      passwordsegunda: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    // this.router.routerState.queryParams.subscribe((params) => {
    //   this.selectedId = +params['id'];
    // });
    this.activatedRoute.paramMap.subscribe((params) => {
      this.token = params.get('token');
      console.log(this.token);
      console.log('andaaaa');
    });
  }
  onRecuContra(value: Ipassword): void {
    this.returnUrl =
      this.activatedRoute.snapshot.queryParams.returnUrl || '/home';
    this.reuContraService
      .recuPassword(
        (value = {
          password: value.password,
          passwordsegunda: value.passwordsegunda,
          token: this.token,
        })
      )
      .subscribe((contra) => {
        this.router.navigate([this.returnUrl]);
        console.log('ta esta');
      });
  }
}
