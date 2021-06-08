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
@Table(name = "questionnaire_sequence")
public class QuestionnaireSequenceEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "questionnaire_sequence_id", nullable = false)
    private String questionnaireSequenceId;

    @Column(name = "question_id")
    private String questionId;

    @Column(name = "answer")
    private String answer;

    @Column(name = "next_question_id")
    private String nextQuestionId;

}
