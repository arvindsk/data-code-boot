package com.adapt.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "columns")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ColumnsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "column_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer columnId;

    @Column(name = "name")
    private String name;

    @Column(name = "value")
    private String value;

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @JoinColumn(name = "elements_id", referencedColumnName = "elements_id")
    private ElementsEntity elementsEntity;

}
