import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Itransferecia } from '../models/transferencia';

@Injectable({
  providedIn: 'root',
})
export class TrasferenciaService {
  constructor(private http: HttpClient) {}

  newTrasferencia(value: Itransferecia, userId: number): Observable<any> {
    return this.http.post<any>(
      `${environment.apiUrl}/api/Transferencia`,
      (value = {
        idUsuario: userId,
        alias: value.alias,
        monto: value.monto,
      })
    );
  }
}
