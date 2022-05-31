import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListaMoviesComponent } from './lista-movies/lista-movies.component';

const routes: Routes = [
  {
    path: "", component: ListaMoviesComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
