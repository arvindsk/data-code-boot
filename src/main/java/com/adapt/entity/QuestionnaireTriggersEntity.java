package com.adapt.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "questionnaire_triggers")
public class QuestionnaireTriggersEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "questionnaire_trigger_id", nullable = false)
    private Integer questionnaireTriggerId;

    @Column(name = "expression", nullable = false)
    private String expression;

    @Column(name = "set_to_name")
    private String setToName;

    @Column(name = "set_value")
    private String setValue;

    @Column(name = "type")
    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @JoinColumn(name = "questionnaires_id", referencedColumnName = "questionnaires_id")
    private QuestionnairesEntity questionnairesEntity;

}
