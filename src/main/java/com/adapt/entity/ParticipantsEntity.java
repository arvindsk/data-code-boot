package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "participants")
public class ParticipantsEntity implements Serializable {

    private static final long serialVersionUID = 2L;
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer participantId;

    @Column(name = "projectid")
    private String projectId;

    @Column(name = "autotime", nullable = false)
    private Date autotime;

    @Column(name = "logid")
    private String logid;

    @Column(name = "loghost")
    private String loghost;

    @Column(name = "patientID")
    private String patientId;

    @Column(name = "firstname", nullable = false)
    private String firstName;

    @Column(name = "lastname", nullable = false)
    private String lastName;

    @Column(name = "siteID", nullable = false)
    private String siteId;

    @Column(name = "naccID", nullable = false)
    private String naccID;

    @Column(name = "gender", nullable = false)
    private String gender;

    @Column(name = "race", nullable = false)
    private String race;

    @Column(name = "ethnicity", nullable = false)
    private String ethnicity;

    @Column(name = "dob", nullable = false)
    private String dob;

    @Column(name = "ques1", nullable = false)
    private String ques1;

    @Column(name = "ques2", nullable = false)
    private String ques2;

    @Column(name = "ques3", nullable = false)
    private String ques3;

    @Column(name = "ques4", nullable = false)
    private String ques4;

    @Column(name = "ques5", nullable = false)
    private String ques5;

    @Column(name = "ques6", nullable = false)
    private String ques6;

    @Column(name = "autolog", nullable = false)
    private Date autolog;

    @Column(name = "revlogid")
    private String revlogid;

    @Column(name = "revloghost")
    private String revloghost;

}
