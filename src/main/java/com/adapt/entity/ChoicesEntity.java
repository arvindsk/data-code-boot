package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "choices")
public class ChoicesEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "chioce_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer chioceId;

    @Column(name = "name")
    private String name;

    @Column(name = "value")
    private String value;

    @Column(name = "elements_id", nullable = false)
    private Integer elementsId;

}
