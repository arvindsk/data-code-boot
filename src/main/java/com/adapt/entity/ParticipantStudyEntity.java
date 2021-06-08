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
@Table(name = "participant_study")
public class ParticipantStudyEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "participant_study_id", nullable = false)
    private String participantStudyId;

    @Column(name = "patient_ID", nullable = false)
    private String patientId;

    @Column(name = "study_information")
    private String studyInformation;

    @Column(name = "timeline")
    private String timeline;

    @Column(name = "study_id")
    private String studyId;

}
