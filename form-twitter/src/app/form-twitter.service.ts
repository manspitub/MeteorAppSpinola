import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { LoginDto } from './model/dto/login.dto';
import { FormResponse, RegisterResponse } from './model/form_response';
import { FormGroup } from '@angular/forms';
import { RegisterDto } from './model/dto/register.dto';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};

@Injectable({
  providedIn: 'root'
})
export class FormTwitterService {

  constructor(private http: HttpClient) { }


  login(login: LoginDto): Observable<FormResponse> {

    let requestUrl = 'https://www.minitwitter.com:3001/apiv1/auth/login'
    return this.http.post<FormResponse>(requestUrl, login, DEFAULT_HEADERS);
  }

  register(register: RegisterDto): Observable<FormResponse> {

    let requestUrl = 'https://www.minitwitter.com:3001/apiv1/auth/signup'
    return this.http.post<RegisterResponse>(requestUrl, register, DEFAULT_HEADERS);
  }

}
