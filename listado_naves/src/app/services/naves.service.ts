import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { NavesListComponent } from '../components/naves-list/naves-list.component';
import { NavesListResponse } from '../models/interfaces/people.interface';

@Injectable({
  providedIn: 'root'
})
export class NavesService {

  constructor(private http: HttpClient) { }

  getNaves(): Observable<NavesListResponse>{
    return this.http.get<NavesListResponse>('https://swapi.dev/api/starships/')
  }
}
