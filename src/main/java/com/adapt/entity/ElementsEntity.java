package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "elements")
public class ElementsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "elements_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer elementsId;

    @Column(name = "startWithNewLine")
    private Integer startWithNewLine;

    @Column(name = "hasOther")
    private Integer hasOther;


    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "visibleIf")
    private String visibleIf;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "title")
    private String title;

    @Column(name = "titleLocation")
    private String titleLocation;

    @Column(name = "colCount")
    private Integer colCount;

    @Column(name = "description")
    private String description;

    @Column(name = "inputType")
    private String inputType;

    @Column(name = "otherText")
    private String otherText;

    @Column(name = "popupdescription")
    private byte[] popupdescription;

    @Column(name = "page_id", nullable = false)
    private Integer pageId;

    @Column(name = "questionnaires_id", nullable = false)
    private Integer questionnairesId;

}
