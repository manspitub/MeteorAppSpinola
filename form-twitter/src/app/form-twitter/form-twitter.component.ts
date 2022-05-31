import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { FormTwitterService } from '../form-twitter.service';
import { LoginDto } from '../model/dto/login.dto';

@Component({
  selector: 'app-form-twitter',
  templateUrl: './form-twitter.component.html',
  styleUrls: ['./form-twitter.component.css']
})
export class FormTwitterComponent implements OnInit {



  constructor(private formService: FormTwitterService, private router: Router) { }

  ngOnInit(): void {
  }
  login = new FormGroup({
    email: new FormControl(''),
    password: new FormControl(''),
  });

  doLogin(){
    let loginDto = new LoginDto();
    loginDto.email = this.login.controls['email'].value;
    loginDto.password = this.login.controls['password'].value;
    this.formService.login(loginDto).subscribe(loginResult => {
      alert(`Te has logueado y este es tu token: ${loginResult.token}`)
      localStorage.setItem('token', loginResult.token)
    })
    this.router.navigate(['/list'], )
  }


}
