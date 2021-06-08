package com.adapt.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name = "questionnaire")
public class QuestionnaireEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "question_id", nullable = false)
    private String questionId;

    @Column(name = "questions")
    private byte[] questions;

    @Column(name = "study_id")
    private String studyId;

}
