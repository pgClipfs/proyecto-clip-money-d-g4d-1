import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { InewUser } from '../models/inew-user';

import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class GetUserService {
  constructor(private http: HttpClient) {}

  getUser(userg: string): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/api/Usuarios/${userg}`);
  }

  updateUser(userName: string, user: InewUser): Observable<any> {
    return this.http.put<any>(
      `${environment.apiUrl}/api/Usuarios/${userName}`,
      (user = {
        nombre: user.nombre,
        apellido: user.apellido,
        dni: user.dni,
        telefono: user.telefono,
        email: user.email,
        nomUsuario: user.nomUsuario,
        password: user.password,
        idPais: user.idPais,
        idProvincia: user.idProvincia,
        idLocalidad: user.idLocalidad,
        calle: user.calle,
        altura: user.altura,
      })
    );
    console.log('fnmsdsd');
  }
}
