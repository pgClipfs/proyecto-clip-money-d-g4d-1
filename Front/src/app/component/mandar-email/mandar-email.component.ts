import { Component, OnInit, Inject } from '@angular/core';
import { Iemail } from '../../models/inew-user';
import { RecuperarContraseñaService } from '../../service/recuperar-contraseña.service';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-mandar-email',
  templateUrl: './mandar-email.component.html',
  styleUrls: ['./mandar-email.component.css'],
})
export class MandarEmailComponent implements OnInit {
  upMail: FormGroup;
  constructor(
    private recuContraService: RecuperarContraseñaService,
    private builder: FormBuilder,
    public dialogRef: MatDialogRef<MandarEmailComponent>,
    @Inject(MAT_DIALOG_DATA) public massage: string
  ) {
    this.upMail = this.builder.group({
      email: ['', Validators.required],
    });
  }

  ngOnInit(): void {}
  onMail(value: Iemail): void {
    this.recuContraService.mandarMail(value).subscribe((email) => {
      console.log(email);
    });
  }
}
