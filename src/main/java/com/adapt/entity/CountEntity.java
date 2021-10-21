package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "count")
public class CountEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "count_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer countId;

    @Column(name = "name")
    private Integer name;

}
