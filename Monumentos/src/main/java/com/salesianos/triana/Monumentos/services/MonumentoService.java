package com.salesianos.triana.Monumentos.services;

import com.salesianos.triana.Monumentos.model.Categoria;
import com.salesianos.triana.Monumentos.repo.CategoriaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MonumentoService {

    @Autowired
    private final CategoriaRepository repository;

    public Categoria addCategoria(Long id){
        return repository.findById(id).get();
    }

}
