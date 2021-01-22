import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Iemail } from '../models/inew-user';
import { Ipassword } from '../models/inew-user';

@Injectable({
  providedIn: 'root',
})
export class RecuperarContraseñaService {
  constructor(private http: HttpClient) {}

  mandarMail(value: Iemail): Observable<any> {
    return this.http.put<any>(`${environment.apiUrl}/api/Usuarios`, value);
  }

  recuPassword(value: Ipassword): Observable<any> {
    return this.http.put<any>(
      `${environment.apiUrl}/api/UsuariosRecuContra`,
      value
    );
  }
}
