package com.adapt.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
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

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @JoinColumn(name = "questionnaires_id", referencedColumnName = "questionnaires_id")
    private QuestionnairesEntity questionnairesEntity;

    @OneToMany(mappedBy = "pagesEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<ElementsEntity> elementsEntities = new HashSet<>();

}
