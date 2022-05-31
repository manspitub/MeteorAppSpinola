package com.salesianos.triana.Monumentos.util;

import com.salesianos.triana.Monumentos.model.Categoria;
import com.salesianos.triana.Monumentos.model.Monumento;
import com.salesianos.triana.Monumentos.repo.CategoriaRepository;
import com.salesianos.triana.Monumentos.repo.MonumentoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
@RequiredArgsConstructor
public class InitData {

    private final MonumentoRepository monumentoRepository;
    private final CategoriaRepository categoriaRepository;

    @PostConstruct
    public void init() {

        Categoria c1 = Categoria.builder()
                .name("Histórico")
                .url("historico.png")
                .build();

        Categoria c2 = Categoria.builder()
                .name("nacional")
                .url("nacional.png")
                .build();

        categoriaRepository.save(c1);
        categoriaRepository.save(c2);

        Monumento m1 = Monumento.builder()
                .nombre("Valle de los caidos")
                .categoria(c2)
                .nombreCiudad("Madrid")
                .nombrePais("España")
                .descripcion("Este es un monumento muy importante a nivel nacional")
                .codigo("ES")
                .localizacion("40.5914, -4.1474")
                .build();

        Monumento m2 = Monumento.builder()
                .nombre("Coliseo Romano")
                .categoria(c1)
                .nombreCiudad("Roma")
                .nombrePais("Italia")
                .descripcion("Este es un monumento muy importante a nivel histórico")
                .codigo("IT")
                .localizacion("41.8902102, 124922309")
                .build();

        monumentoRepository.save(m1);
        monumentoRepository.save(m2);


    }

}
