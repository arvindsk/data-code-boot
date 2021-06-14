package com.adapt.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
public class Participant {
    private Integer participantId;
    private String firstName;
    private String lastName;
    private String dob;
    private Date registeredDate;
    private String timeline;
    private String questionnaireCompleted;
}
