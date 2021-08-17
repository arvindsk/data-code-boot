package com.adapt.entity;

import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "participant_email")
public class ParticipantEmailEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "participant_email_id", nullable = false)
    private Integer participantEmailId;

    @Column(name = "participant_id", nullable = false)
    private Integer participantId;

    @Column(name = "email")
    private String email;

    @Builder
    public ParticipantEmailEntity(
            Integer participantId, String email) {
        this.participantId = participantId;
        this.email = email;
    }
}
