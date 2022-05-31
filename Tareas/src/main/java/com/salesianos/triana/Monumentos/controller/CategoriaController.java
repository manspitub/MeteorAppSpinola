package com.salesianos.triana.Monumentos.controller;

import com.salesianos.triana.Monumentos.model.Categoria;
import com.salesianos.triana.Monumentos.repo.CategoriaRepository;
import com.salesianos.triana.Monumentos.repo.MonumentoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class CategoriaController {

    private final CategoriaRepository categoriaRepository;
    private final MonumentoRepository monumentoRepository;

    @GetMapping("categorias")
    public ResponseEntity<List<Categoria>> getCategorias(){
        List<Categoria> result = categoriaRepository.findAll();

        if (result.isEmpty())
            return ResponseEntity.notFound().build();
        return ResponseEntity.ok(result);
    }
    @GetMapping("categoria/{id}")
    public ResponseEntity<Categoria> getCategoria(@PathVariable Long id){

        return ResponseEntity.of(categoriaRepository.findById(id));


    }

    @PutMapping("categoria/{id}")
    public ResponseEntity<Categoria> edit(@RequestBody Categoria categoria, @PathVariable Long id){
        return categoriaRepository.findById(id)
                .map(c -> {
                    c.setName(categoria.getName());
                    c.setUrl(categoria.getUrl());

                    return categoriaRepository.save(c);
                })
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());

    }

    @PostMapping("categoria")
    public ResponseEntity<Categoria> create(@RequestBody Categoria categoria){
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(categoriaRepository.save(categoria));
    }

    @DeleteMapping("categoria/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id){
        if (categoriaRepository.existsById(id))
            monumentoRepository.findAll().forEach(m ->{
                if (m.getCategoria().equals(categoriaRepository.findById(id).get()))
                    m.setCategoria(null);
            });
            categoriaRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

}
