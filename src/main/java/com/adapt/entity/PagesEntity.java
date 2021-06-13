package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "pages")
public class PagesEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "page_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer pageId;


    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "title")
    private String title;

    @Column(name = "questionnaires_id", nullable = false)
    private Integer questionnairesId;

}
