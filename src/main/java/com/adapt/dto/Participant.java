package com.adapt.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
public class Participant {
    private Integer id;
    private String firstName;
    private String lastName;
    private String dob;
    private Date autotime;
    private String timeline;
    private String StudyCompleted;
}
