import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { FormTwitterService } from '../form-twitter.service';
import { LoginDto } from '../model/dto/login.dto';
import { RegisterDto } from '../model/dto/register.dto';

@Component({
  selector: 'app-register-twitter',
  templateUrl: './register-twitter.component.html',
  styleUrls: ['./register-twitter.component.css']
})
export class RegisterTwitterComponent implements OnInit {

  constructor(private formService: FormTwitterService) { }

  ngOnInit(): void {
  }

  register = new FormGroup({
    username: new FormControl(''),
    email: new FormControl(''),
    password: new FormControl(''),
    code: new FormControl('')
  });

  doRegister(){
    let loginDto = new RegisterDto();
    loginDto.email = this.register.controls['email'].value;
    loginDto.password = this.register.controls['password'].value;
    loginDto.code = this.register.controls['code'].value;
    loginDto.username = this.register.controls['username'].value;
    this.formService.register(loginDto).subscribe(loginResult => {
      alert(`Te has registrado y este es tu token: ${loginResult.token}`)
    })
  }

}
