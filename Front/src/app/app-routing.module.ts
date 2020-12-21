import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './component/home/home.component';
import { LoginComponent } from './component/login/login.component';
import { AuthGuard } from './helpers/auth.guard';
import { RegistroComponent } from './component/registro/registro.component';
import { EditarComponent } from './component/editar/editar.component';
import { PrincipalComponent } from './component/principal/principal.component';

const routes: Routes = [
  { path: '', component: PrincipalComponent },
  { path: 'home', component: HomeComponent, canActivate: [AuthGuard] },
  { path: 'editar', component: EditarComponent },
  // { path: 'login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },

  { path: '**', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
