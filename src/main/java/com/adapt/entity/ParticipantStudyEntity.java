package com.adapt.entity;

import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity
@Table(name = "participant_study")
public class ParticipantStudyEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "participant_study_id", nullable = false)
    private Integer participantStudyId;

    @Column(name = "participant_id", nullable = false)
    private Integer participantId;

    @Column(name = "study_information")
    private String studyInformation;

    @Column(name = "timeline")
    private String timeline;

    @Column(name = "study_id")
    private Integer studyId;

    @Column(name = "status")
    private String status;
    @Column(name = "completed_time")
    private Date completedTime;

    public ParticipantStudyEntity(){

    }

    @Builder
    public ParticipantStudyEntity(Integer participantId, String studyInformation, String timeline, Integer studyId, String status, Date completedTime) {
        this.participantId = participantId;
        this.studyInformation = studyInformation;
        this.timeline = timeline;
        this.studyId = studyId;
        this.status = status;
        this.completedTime = completedTime;
    }
}
