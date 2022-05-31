import { Component, OnInit } from '@angular/core';
import { Popular } from '../interfaces/model/popular_tv.interface';
import { ListaMoviesService } from '../service/lista-movies.service';

@Component({
  selector: 'app-lista-movies',
  templateUrl: './lista-movies.component.html',
  styleUrls: ['./lista-movies.component.css']
})
export class ListaMoviesComponent implements OnInit {

  listaMovies: Popular[] = [];



  constructor(private movieService: ListaMoviesService) { }

  ngOnInit(): void {
    this.movieService.getPopular().subscribe(resp => {
      this.listaMovies = resp.results;
    })
  }

  getImageUrl(pop: Popular){
    return `http://image.tmdb.org/t/p/w500/${pop.poster_path}`;
  }

  



}
