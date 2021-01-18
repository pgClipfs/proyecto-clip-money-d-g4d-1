import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { MatPaginatorModule } from '@angular/material/Paginator';
import { MatProgressBarModule } from '@angular/material/Progress-bar';
import { MatSnackBarModule } from '@angular/material/Snack-Bar';
import { MatSortModule } from '@angular/material/Sort';

import { MatTableModule } from '@angular/material/Table';
import { AppRoutingModule } from './app-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { JwtInterceptor } from './helpers/jwt.interceptor';
import { ErrorInterceptor } from './helpers/error.interceptor';

import { AppComponent } from './app.component';
import { HomeComponent } from './component/home/home.component';
import { LoginComponent } from './component/login/login.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { RegistroComponent } from './component/registro/registro.component';
import { PrincipalComponent } from './component/principal/principal.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { EditarComponent } from './component/editar/editar.component';
import { TransferenciaComponent } from './component/transferencia/transferencia.component';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { ModalDestinoComponent } from './component/modal-destino/modal-destino.component';
import { NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegistroComponent,
    PrincipalComponent,
    EditarComponent,
    TransferenciaComponent,
    ModalDestinoComponent,
  ],
  imports: [
    BrowserModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatSnackBarModule,
    MatSortModule,
    MatTableModule,
    [NgbModule],
    AppRoutingModule,
    [FontAwesomeModule],
    BrowserAnimationsModule,
    MatDialogModule,
    MatButtonModule,

    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NgxPaginationModule,
  ],
  entryComponents: [ModalDestinoComponent],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
