package com.adapt.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class ParticipantStudy {
    private String firstName;
    private String timeline;
    private String studyName;
    private String studyInformation;
    private Integer participantStudyId;
    private Integer participantId;
    private String status;
    private Integer studyId;
    private Date completedDate;
    private boolean enabled;
    private String activeTimeline;
    private boolean endedTimeline;

}
