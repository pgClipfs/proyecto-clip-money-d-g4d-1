import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './component/home/home.component';
import { LoginComponent } from './component/login/login.component';
import { AuthGuard } from './helpers/auth.guard';
import { RegistroComponent } from './component/registro/registro.component';
import { EditarComponent } from './component/editar/editar.component';
import { PrincipalComponent } from './component/principal/principal.component';
import { TransferenciaComponent } from './component/transferencia/transferencia.component';
import { RecuperacionComponent } from './component/recuperacion/recuperacion.component';
import { MandarEmailComponent } from './component/mandar-email/mandar-email.component';

const routes: Routes = [
  { path: '', component: PrincipalComponent },
  { path: 'recuperacion/:token', component: RecuperacionComponent },
  { path: 'mandaremail', component: MandarEmailComponent },
  { path: 'home', component: HomeComponent, canActivate: [AuthGuard] },
  { path: 'editar', component: EditarComponent },
  // { path: 'login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'transferir', component: TransferenciaComponent },

  { path: '**', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
