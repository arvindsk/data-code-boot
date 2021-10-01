package com.adapt.dto;

import lombok.*;

import java.util.Date;

@Builder
@Data
public class Participant {
    private Integer participantId;
    private String patientId;
    private String firstName;
    private String lastName;
    private String dob;
    private Date registeredDate;
    private String timeline;
    private String baselineStatus;
    private String firstyearStatus;
    private String thirdyearStatus;
    private String email;
}
