import { Component, OnInit, Inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthenticationService } from 'src/app/service/authentication.service';
import { MandarEmailComponent } from '../mandar-email/mandar-email.component';

import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

import {
  MatDialogRef,
  MAT_DIALOG_DATA,
  MatDialog,
} from '@angular/material/dialog';

@Component({
  selector: 'app-modal-login',
  templateUrl: './modal-login.component.html',
  styleUrls: ['./modal-login.component.css'],
})
export class ModalLoginComponent implements OnInit {
  usernameControl = new FormControl('', Validators.required);
  passwordControl = new FormControl('', Validators.required);
  returnUrl: string;
  error = '';

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService,

    public dialog: MatDialog
  ) {}

  ngOnInit(): void {
    this.returnUrl = this.route.snapshot.queryParams.returnUrl || '/home';
  }
  openDialog(): void {
    const dialoRef = this.dialog.open(MandarEmailComponent, {});
    dialoRef.afterClosed().subscribe((res) => {
      console.log(res);
    });
    // this.dialog.closeAll();
  }
  onSubmit(): void {
    this.authenticationService
      .login(this.usernameControl.value, this.passwordControl.value)
      .subscribe(
        (data) => {
          this.router.navigate([this.returnUrl]);
        },
        (error) => {
          this.error = error;
        }
      );
    this.dialog.closeAll();
  }
  irRegistro(): void {
    this.dialog.closeAll();
  }
}
