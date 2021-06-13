package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "questionnaires")
public class QuestionnairesEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "questionnaires_id", nullable = false)
    private Integer questionnairesId;

    @Column(name = "showProgressBar")
    private String showProgressBar;

    @Column(name = "showPageTitles")
    private Integer showPageTitles;

    @Column(name = "showQuestionNumbers")
    private String showQuestionNumbers;

    @Column(name = "completedHtml")
    private byte[] completedHtml;

    @Column(name = "title")
    private String title;

    @Column(name = "question_type", nullable = false)
    private String questionType;

}
