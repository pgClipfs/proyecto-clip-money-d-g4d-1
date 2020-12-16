import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IgetUser } from 'src/app/models/userget';

import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class GetUserService {
  constructor(private http: HttpClient) {}

  getUser(id: number): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/api/Usuarios/${id}`);
  }
}
