package com.adapt.dto;

import lombok.*;

import java.util.Date;

@Builder
@Data
public class Participant {
    private Integer participantId;
    private String firstName;
    private String lastName;
    private String dob;
    private Date registeredDate;
    private String timeline;
    private Date completedDate;
}
