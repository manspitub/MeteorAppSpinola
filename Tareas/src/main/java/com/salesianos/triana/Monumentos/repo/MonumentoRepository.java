package com.salesianos.triana.Monumentos.repo;

import com.salesianos.triana.Monumentos.dto.GetMonumentoDto;
import com.salesianos.triana.Monumentos.model.Monumento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MonumentoRepository
        extends JpaRepository<Monumento, Long> {

    List<Monumento> findByNombrePaisContainsIgnoreCase(String nombrePais);
    List<Monumento> findByNombreContainsIgnoreCase(String nombre);

}
