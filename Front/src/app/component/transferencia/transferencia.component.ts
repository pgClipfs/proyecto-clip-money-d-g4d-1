import { Component, OnInit } from '@angular/core';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { Itransferecia } from 'src/app/models/transferencia';
import { IgetDestinos, InewDestino } from '../../models/inew-user';
import { TrasferenciaService } from '../../service/trasferencia.service';
import tokenGet from '../../helpers/get.id';
import { SaldoService } from '../../service/saldo.service';
import { GetUserService } from '../../service/get-user.service';
import { MovimientosService } from '../../service/movimientos.service';

import { MatDialog } from '@angular/material/dialog';
import { ModalDestinoComponent } from '../modal-destino/modal-destino.component';

@Component({
  selector: 'app-transferencia',
  templateUrl: './transferencia.component.html',
  styleUrls: ['./transferencia.component.css'],
})
export class TransferenciaComponent implements OnInit {
  upTransferencia: FormGroup;
  upDestino: FormGroup;
  userId: number;
  destinoId: number;
  idTipoMov: number;
  listDestino: IgetDestinos[];
  selectedDestino: IgetDestinos = {
    idUsuario: 0,
    alias: '',
    nombre: '',
    apellido: '',
    email: '',
    idDestino: 0,
    id: 0,
  };

  constructor(
    private buider: FormBuilder,
    private trasferenciaService: TrasferenciaService,
    private saldoService: SaldoService,
    private movimientosService: MovimientosService,
    private getUserService: GetUserService,

    public dialog: MatDialog
  ) {
    this.upTransferencia = this.buider.group({
      idUsuario: ['', Validators.required],
      idDestino: ['', Validators.required],
      monto: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.getUserService.getidDestino().subscribe(
      (destinosFromApi: IgetDestinos[]) => {
        this.listDestino = destinosFromApi;
      },
      (error) => console.error(error)
    );
  }

  openDialog(): void {
    const dialoRef = this.dialog.open(ModalDestinoComponent, {});
    dialoRef.afterClosed().subscribe((res) => {
      console.log(res);
    });
  }

  onDestino(value: InewDestino): void {
    this.userId = Number(tokenGet());
    this.getUserService
      .newDestino(value, this.userId)
      .subscribe((destino) => console.log(destino));
  }
  onSelectAlias(id: number): void {
    this.destinoId = id;
  }
  onSubmit(value: Itransferecia): void {
    this.idTipoMov = 3;
    this.userId = Number(tokenGet());
    this.trasferenciaService
      .newTrasferencia(value, this.userId)
      .subscribe((trasferencia) => {
        console.log(trasferencia);
      });
    this.saldoService
      .updateSaldoNumber(this.destinoId, value.monto)
      .subscribe((saldo) => console.log(saldo));
    this.saldoService
      .updateSaldoNumber(this.userId, value.monto)
      .subscribe((saldo) => console.log(saldo));

    this.movimientosService
      .newMovimientoNumber(this.userId, value.monto, this.idTipoMov)
      .subscribe((movientos) => console.log(movientos));
  }
}
