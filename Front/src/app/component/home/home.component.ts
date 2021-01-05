import { Component, OnInit } from '@angular/core';
import { SaldoService } from '../../service/saldo.service';
import { ISaldo, Imonto } from '../../models/saldo';
import tokenGet from '../../helpers/get.id';
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

  constructor(
    private saldoService: SaldoService,
    private builder: FormBuilder
  ) {
    this.upSaldoForm = this.builder.group({
      monto: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.saldoService.getSaldo().subscribe(
      (saldoFormApi: ISaldo[]) => {
        this.saldosList = saldoFormApi;
      },
      (error) => console.error(error)
    );
  }
  onSubmit(value: Imonto): void {
    this.user = Number(tokenGet());
    if (this.saldosList.length > 0) {
      this.saldoService
        .updateSaldo(1, value)
        .subscribe((saldo) => console.log(saldo));
    } else {
      this.saldoService
        .newSaldo(this.user, value)
        .subscribe((saldo) => console.log(saldo));
    }
  }
}
