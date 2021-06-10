package com.adapt.entity;

import lombok.Data;
import lombok.Getter;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Getter
@Table(name = "study")
public class StudyEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "study_id", nullable = false)
    private Integer studyId;

    @Column(name = "study_name")
    private String studyName;

}
