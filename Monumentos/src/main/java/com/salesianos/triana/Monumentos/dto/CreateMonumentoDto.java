package com.salesianos.triana.Monumentos.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class CreateMonumentoDto {

    private String nombre;
    private String nombreCiudad;
    private String nombrePais;
    private String codigo;
    private String localizacion;
    private String descripcion;
    private String url;
    private Long idCategoria;
}
