import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MaterialImportsModule } from './modules/material-imports.module';
import { FormTwitterComponent } from './form-twitter/form-twitter.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { RegisterTwitterComponent } from './register-twitter/register-twitter.component';
import { ListadoTweetsComponent } from './listado-tweets/listado-tweets.component';

@NgModule({
  declarations: [
    AppComponent,
    FormTwitterComponent,
    RegisterTwitterComponent,
    ListadoTweetsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    MaterialImportsModule,
    FormsModule,
    BrowserAnimationsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
