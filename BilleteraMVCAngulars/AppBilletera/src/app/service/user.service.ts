import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { InewUser } from '../models/inew-user';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private http: HttpClient) {}
  addNewUser(user: InewUser): Observable<any> {
    return this.http.post<any>(`${environment.apiUrl}/api/Usuarios`, user);
  }
}
