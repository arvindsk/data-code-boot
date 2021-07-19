package com.adapt.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "questionnaires")
public class QuestionnairesEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "questionnaires_id", nullable = false)
    private Integer questionnairesId;

    @Column(name = "show_progress_bar")
    private String showProgressBar;

    @Column(name = "show_page_titles", columnDefinition = "BOOLEAN")
    private boolean showPageTitles;

    @Column(name = "show_question_numbers")
    private String showQuestionNumbers;

    @Column(name = "completed_html")
    private String completedHtml;

    @Column(name = "title")
    private String title;

    @Column(name = "show_preview_before_complete")
    private String showPreviewBeforeComplete;

    @Column(name = "check_errors_mode")
    private String checkErrorsMode;

    @Column(name = "study_id")
    private Integer studyId;

    @OneToMany(mappedBy = "questionnairesEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<PagesEntity> pages = new HashSet<>();

    @OneToMany(mappedBy = "questionnairesEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<QuestionnaireTriggersEntity> triggers = new HashSet<>();

}
