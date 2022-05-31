import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Popular, PopularResponse } from '../interfaces/model/popular_tv.interface';


@Injectable({
  providedIn: 'root'
})
export class ListaMoviesService {

  constructor(private http: HttpClient) { }

  getPopular(): Observable<PopularResponse> {
    return this.http.get<PopularResponse>(`https://api.themoviedb.org/3/tv/popular?api_key=6f3f957d9d8dc6a98fed68a333b8209c&language=en-US&page=1`)
  }
}
