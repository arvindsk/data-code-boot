package com.adapt.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "elements")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ElementsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "elements_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer elementsId;

    @Column(name = "start_with_new_line", columnDefinition = "BOOLEAN")
    private boolean startWithNewLine;

    @Column(name = "has_other", columnDefinition = "BOOLEAN")
    private boolean hasOther;

    @Column(name = "is_required", columnDefinition = "BOOLEAN")
    private boolean required;

    @Column(name = "is_all_row_required", columnDefinition = "BOOLEAN")
    private boolean allRowRequired;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "visible_if")
    private String visibleIf;

    @Column(name = "render_as")
    private String renderAs;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "title")
    private String title;

    @Column(name = "title_location")
    private String titleLocation;

    @Column(name = "col_count")
    private Integer colCount;

    @Column(name = "description")
    private String description;

    @Column(name = "input_type")
    private String inputType;

    @Column(name = "other_text")
    private String otherText;

    @Column(name = "popupdescription")
    private String popupdescription;

    @Column(name = "choices_by_url")
    private String choicesByUrl;

    @Column(name = "enable_if")
    private String enableIf;

    @Column(name = "questionnaires_id")
    private Integer questionnairesId;

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @JoinColumn(name = "page_id", referencedColumnName = "page_id")
    private PagesEntity pagesEntity;

    @OneToMany(mappedBy = "elementsEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<ColumnsEntity> columns = new HashSet<>();

    @OneToMany(mappedBy = "elementsEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<RowsEntity> rows = new HashSet<>();

    @OneToMany(mappedBy = "elementsEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<ChoicesEntity> choices = new HashSet<>();

}
