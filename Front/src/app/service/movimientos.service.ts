import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Imonto } from '../models/saldo';

@Injectable({
  providedIn: 'root',
})
export class MovimientosService {
  constructor(private http: HttpClient) {}

  newMovimiento(id: number, monto: Imonto): Observable<any> {
    return this.http.post<any>(
      `${environment.apiUrl}/api/Movimientoes/${id}`,
      monto
    );
  }

  getMoviminetos(): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/api/Movimientoes`);
  }
}
