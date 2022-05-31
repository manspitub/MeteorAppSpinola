package com.salesianos.triana.Monumentos.dto;

import com.salesianos.triana.Monumentos.model.Monumento;
import com.salesianos.triana.Monumentos.services.MonumentoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MonumentoDtoConverter {

    private final MonumentoService service;


    public Monumento createMonumentoDtoToMonumento(CreateMonumentoDto c){



        return Monumento.builder()
                .nombre(c.getNombre())
                .codigo(c.getCodigo())
                .descripcion(c.getDescripcion())
                .localizacion(c.getLocalizacion())
                .nombreCiudad(c.getNombreCiudad())
                .nombrePais(c.getNombrePais())
                .categoria(service.addCategoria(c.getIdCategoria()))
                .build();
    }

    public GetMonumentoDto monumentoToGetMonumentoDto(Monumento m){

        return GetMonumentoDto
                .builder()
                .id(m.getId())
                .codigo(m.getCodigo())
                .descripcion(m.getDescripcion())
                .localizacion(m.getLocalizacion())
                .nombre(m.getNombre())
                .nombreCiudad(m.getNombreCiudad())
                .nombrePais(m.getNombrePais())
                .nombreCategoria(m.getCategoria().getName())
                .urlCategoria(m.getCategoria().getUrl())
                .build();
    }

}
