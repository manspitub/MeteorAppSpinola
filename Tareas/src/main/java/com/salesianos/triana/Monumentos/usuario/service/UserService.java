package com.salesianos.triana.Monumentos.usuario.service;

import com.salesianos.triana.Monumentos.services.BaseService;
import com.salesianos.triana.Monumentos.usuario.dto.NewUserRequest;
import com.salesianos.triana.Monumentos.usuario.model.User;
import com.salesianos.triana.Monumentos.usuario.repo.UserRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService extends  BaseService<User, Long, UserRepository> {


    private final PasswordEncoder passwordEncoder;

    public Optional<User> findByUsername(String username) {
        return repositorio.findFirstByUsername(username);
    }

    public User newUser(NewUserRequest request){
        return save(User.builder()
                .username(request.getUsername())
                .password(passwordEncoder.encode(request.getPassword()))
                .build());
    }


}
