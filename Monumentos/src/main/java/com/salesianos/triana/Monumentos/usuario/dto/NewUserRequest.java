package com.salesianos.triana.Monumentos.usuario.dto;

import lombok.Value;
import org.springframework.stereotype.Component;

@Value
public class NewUserRequest {

    private String username;
    private String password;
    private String verifyPassword;
}
