import { Component, OnInit } from '@angular/core';
import { SaldoService } from '../../service/saldo.service';
import { ISaldo, Imonto } from '../../models/saldo';
import tokenGet from '../../helpers/get.id';
import { ActivatedRoute, Router } from '@angular/router';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  saldosList: ISaldo[];
  user: number;
  upSaldoForm: FormGroup;
  saldoActual: number;
  returnUrl: string;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private saldoService: SaldoService,
    private builder: FormBuilder
  ) {
    this.upSaldoForm = this.builder.group({
      monto: ['', Validators.required],
    });
  }

  buscarSaldo(): void {
    this.saldoService.getSaldo().subscribe(
      (saldoFormApi: ISaldo[]) => {
        this.saldosList = saldoFormApi;
        console.log(this.saldosList);
        for (let i = 0; i < this.saldosList.length; i++) {
          this.saldoActual = this.saldosList[i].monto;
        }
      },
      (error) => console.error(error)
    );
  }
  ngOnInit(): void {
    this.buscarSaldo();
  }
  onSubmit(value: Imonto): void {
    this.user = Number(tokenGet());
    if (this.saldosList.length > 0) {
      this.saldoService.updateSaldo(14, value).subscribe((saldo) => {
        this.buscarSaldo();
      });
    } else {
      this.saldoService
        .newSaldo(this.user, value)
        .subscribe((saldo) => this.buscarSaldo());
    }
  }
}
