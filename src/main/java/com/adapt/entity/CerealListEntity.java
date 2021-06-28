package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "cereal_list")
public class CerealListEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "cereal_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cerealId;

    @Column(name = "name")
    private String name;

}
