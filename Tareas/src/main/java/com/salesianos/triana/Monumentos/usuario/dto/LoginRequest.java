package com.salesianos.triana.Monumentos.usuario.dto;

import lombok.Value;


@Value
public class LoginRequest {

    private String username, password;

}