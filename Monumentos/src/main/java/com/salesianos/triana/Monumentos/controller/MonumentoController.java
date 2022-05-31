package com.salesianos.triana.Monumentos.controller;

import com.salesianos.triana.Monumentos.dto.CreateMonumentoDto;
import com.salesianos.triana.Monumentos.dto.GetMonumentoDto;
import com.salesianos.triana.Monumentos.dto.MonumentoDtoConverter;
import com.salesianos.triana.Monumentos.model.Categoria;
import com.salesianos.triana.Monumentos.model.Monumento;
import com.salesianos.triana.Monumentos.repo.CategoriaRepository;
import com.salesianos.triana.Monumentos.repo.MonumentoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class MonumentoController {

    private final MonumentoRepository monumentoRepository;
    private final CategoriaRepository categoriaRepository;

    private final MonumentoDtoConverter dtoConverter;

    @GetMapping("monumentos")
    public ResponseEntity<List<GetMonumentoDto>> getMonumentos(){
        List<GetMonumentoDto> listaMonumentos = new ArrayList<>();

        monumentoRepository.findAll().stream().forEach(m->{
            listaMonumentos.add(dtoConverter.monumentoToGetMonumentoDto(m));
        });

        if (listaMonumentos.isEmpty())
            return ResponseEntity.notFound().build();
        return ResponseEntity.ok(listaMonumentos);
    }

    @GetMapping("monumento/{id}")
    public ResponseEntity<GetMonumentoDto> getMonumento(@PathVariable Long id){
        Optional<Monumento> mon = monumentoRepository.findById(id);

        if (mon.isPresent()){
            return ResponseEntity.ok(dtoConverter.monumentoToGetMonumentoDto(mon.get()));
        }
        else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("monumento/{id}")
    public ResponseEntity<Monumento> editarMonumento(@PathVariable Long id, @RequestBody CreateMonumentoDto edit) {
        return monumentoRepository.findById(id)
                .map(m -> {
                    m.setNombre(edit.getNombre());
                    m.setNombreCiudad(edit.getNombreCiudad());
                    m.setCodigo(edit.getCodigo());
                    m.setNombrePais(edit.getNombrePais());
                    m.setDescripcion(edit.getDescripcion());
                    return monumentoRepository.save(m);
                })
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping("monumento")
    public ResponseEntity<?> crearMonumento(@RequestBody CreateMonumentoDto monumentoACrear){

        Monumento mon = dtoConverter.createMonumentoDtoToMonumento(monumentoACrear);

        return ResponseEntity.ok(dtoConverter.monumentoToGetMonumentoDto(mon));
    }

    @DeleteMapping("monumento/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id){
        Optional<Monumento> monumentoDelete = monumentoRepository.findById(id);
        if (monumentoDelete.isPresent()){
            monumentoRepository.deleteById(id);
        }
        return ResponseEntity.noContent().build();
    }

    @GetMapping("monumento/pais/{pais}")
    public ResponseEntity<List<Monumento>> monumentosPais(@PathVariable("pais") String nombrePais) {
        List<Monumento> result =
                monumentoRepository.findByNombrePaisContainsIgnoreCase(nombrePais);
        if (result.isEmpty())
            return ResponseEntity.notFound().build();

        return ResponseEntity.ok(result);
    }

    @GetMapping("monumento/nombre/{nombre}")
    public ResponseEntity<List<Monumento>> monumentosNombre(@PathVariable("nombre") String nombreMonumentos) {
        List<Monumento> result =
                monumentoRepository.findByNombreContainsIgnoreCase(nombreMonumentos);
        if (result.isEmpty())
            return ResponseEntity.notFound().build();

        return ResponseEntity.ok(result);
    }

    @GetMapping("monumento/categoria/{id}")
    public ResponseEntity<List<Monumento>> getMonumentosByCategoria(@PathVariable Long id){

        List<Monumento> monEncontrados = new ArrayList<>();

        if (categoriaRepository.existsById(id))
            monumentoRepository.findAll().stream().forEach(m->{
                if (m.getCategoria().equals(categoriaRepository.findById(id).get()))
                    monEncontrados.add(m);
            });

        if (monEncontrados.isEmpty()){
            return ResponseEntity.notFound().build();
        }

        else return ResponseEntity.ok(monEncontrados);




    }

}
