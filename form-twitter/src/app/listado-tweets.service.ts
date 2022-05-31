import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Tweets, TweetsResponse } from './model/tweets_response';




@Injectable({
  providedIn: 'root'
})
export class ListadoTweetsService {

  constructor(private http: HttpClient) { }



  getTweets(): Observable<TweetsResponse[]>{
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    });
    
    let requestUrl = `https://www.minitwitter.com:3001/apiv1/tweets/all`;
    return this.http.get<TweetsResponse[]>(requestUrl, {headers: headers});
  }
}
