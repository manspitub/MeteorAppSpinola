import { Component, OnInit } from '@angular/core';
import { Naves } from 'src/app/models/interfaces/people.interface';
import { NavesService } from 'src/app/services/naves.service';

@Component({
  selector: 'app-naves-list',
  templateUrl: './naves-list.component.html',
  styleUrls: ['./naves-list.component.css']
})
export class NavesListComponent implements OnInit {

  listaNaves: Naves[] = [];


  constructor(private naveService: NavesService) { }

  ngOnInit(): void {
    this.naveService.getNaves().subscribe(resp => {
      this.listaNaves = resp.results;
      
    })
  }

  getPhotoUrl(n: Naves){
    let naveId = n.url.split('/')[5]
    return `https://starwars-visualguide.com/assets/img/starships/${naveId}.jpg`
  }

}
