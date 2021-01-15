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
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

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
    public modal: NgbModal
  ) {
    this.upTransferencia = this.buider.group({
      idUsuario: ['', Validators.required],
      idDestino: ['', Validators.required],
      monto: ['', Validators.required],
    });
    this.upDestino = this.buider.group({
      alias: ['', Validators.required],
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      email: ['', Validators.compose([Validators.required, Validators.email])],
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
    this.movimientosService
      .newMovimientoNumber(this.userId, value.monto, this.idTipoMov)
      .subscribe((movientos) => console.log(movientos));
  }
  onDestino(value: InewDestino): void {
    this.userId = Number(tokenGet());
    this.getUserService
      .newDestino(value, this.userId)
      .subscribe((destino) => console.log(destino));
  }
}
