import { Component, OnInit } from '@angular/core';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { Itransferecia } from 'src/app/models/transferencia';
import { TrasferenciaService } from '../../service/trasferencia.service';
import tokenGet from '../../helpers/get.id';
import { SaldoService } from '../../service/saldo.service';
import { MovimientosService } from '../../service/movimientos.service';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';

@Component({
  selector: 'app-transferencia',
  templateUrl: './transferencia.component.html',
  styleUrls: ['./transferencia.component.css'],
})
export class TransferenciaComponent implements OnInit {
  upTransferencia: FormGroup;
  userId: number;
  idTipoMov: number;

  constructor(
    private buider: FormBuilder,
    private trasferenciaService: TrasferenciaService,
    private saldoService: SaldoService,
    private movimientosService: MovimientosService
  ) {
    this.upTransferencia = this.buider.group({
      idUsuario: ['', Validators.required],
      idDestino: ['', Validators.required],
      monto: ['', Validators.required],
    });
  }

  ngOnInit(): void {}
  onSubmit(value: Itransferecia): void {
    this.idTipoMov = 3;
    this.userId = Number(tokenGet());
    this.trasferenciaService
      .newTrasferencia(value, this.userId)
      .subscribe((trasferencia) => {
        console.log(trasferencia);
      });
    this.saldoService
      .updateSaldoNumber(this.userId, value.monto)
      .subscribe((saldo) => console.log(saldo));
    this.movimientosService
      .newMovimientoNumber(this.userId, value.monto, this.idTipoMov)
      .subscribe((movientos) => console.log(movientos));
  }
}
