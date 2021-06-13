package com.adapt.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ParticipantStudy {
    private String timeline;
    private String studyName;
    private String studyInformation;
    private Integer participantStudyId;
    private String patientId;
    private String status;
    private Integer studyId;


}
