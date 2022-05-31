package com.salesianos.triana.Monumentos.usuario.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class JwtUserReponse {

    private Long id;
    private String username;
    private String token;

}