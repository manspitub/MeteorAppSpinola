import { Component, OnInit } from '@angular/core';
import { ListadoTweetsService } from '../listado-tweets.service';
import { Tweets, TweetsResponse } from '../model/tweets_response';

@Component({
  selector: 'app-listado-tweets',
  templateUrl: './listado-tweets.component.html',
  styleUrls: ['./listado-tweets.component.css']
})
export class ListadoTweetsComponent implements OnInit {

  constructor(private tweetService: ListadoTweetsService) { }

  listaTweets: TweetsResponse[] = []



  ngOnInit(): void {
    this.getAllTweets()
  }

  getAllTweets() {
    this.tweetService.getTweets().subscribe(tweetsResult =>{
      this.listaTweets = tweetsResult;
    })
  }

  getPhotoUrl(t: TweetsResponse){
    return ``
  }



}
