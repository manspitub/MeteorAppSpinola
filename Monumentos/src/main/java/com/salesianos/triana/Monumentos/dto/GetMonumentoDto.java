package com.salesianos.triana.Monumentos.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class GetMonumentoDto {
    private Long id;
    private String nombre;
    private String nombreCiudad;
    private String nombrePais;
    private String codigo;
    private String localizacion;
    private String descripcion;
    private String nombreCategoria;
    private String urlCategoria;
}
