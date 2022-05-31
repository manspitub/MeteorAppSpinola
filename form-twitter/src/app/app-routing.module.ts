import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FormTwitterComponent } from './form-twitter/form-twitter.component';
import { ListadoTweetsComponent } from './listado-tweets/listado-tweets.component';
import { RegisterTwitterComponent } from './register-twitter/register-twitter.component';

const routes: Routes = [
  {
    path: '', component: FormTwitterComponent, 
  },
  {path: 'register', component: RegisterTwitterComponent},
  {path: 'list',component: ListadoTweetsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
