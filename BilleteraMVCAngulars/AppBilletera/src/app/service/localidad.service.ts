import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Localidad } from '../models/localidad';

@Injectable({
  providedIn: 'root',
})
export class LocalidadService {
  constructor(private http: HttpClient) {}

  getPorProvincia(id: number): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/api/Localidads/${id}`);
  }
}
