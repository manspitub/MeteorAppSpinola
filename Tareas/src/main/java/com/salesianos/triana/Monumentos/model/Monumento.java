package com.salesianos.triana.Monumentos.model;


import lombok.*;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Monumento {

    @Id @GeneratedValue
    private Long id;

    private String codigo;

    private String nombrePais;

    private String nombreCiudad;

    private String localizacion;

    private String nombre;

    @Lob
    private String descripcion;

    @ManyToOne()
    @JoinColumn(name = "categoria", foreignKey = @ForeignKey(name = "FK_MONUMENTO_CATEGORIA"))
    private Categoria categoria;
}
