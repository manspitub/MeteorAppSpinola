package com.salesianos.triana.Monumentos.usuario.repo;

import com.salesianos.triana.Monumentos.usuario.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findFirstByUsername(String username);

}
