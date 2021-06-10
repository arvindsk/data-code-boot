package com.adapt.controllers;

import com.adapt.dto.LoginRequest;
import com.adapt.dto.Participant;
import com.adapt.services.LoginService;
import com.adapt.services.ParticipantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/adapt/")
public class ParticipantController {

    private final ParticipantService participantService;

    @Autowired
    public ParticipantController(ParticipantService participantService) {
        this.participantService = participantService;
    }

    @GetMapping("collect-data")
    public List<Participant> getParticipants(String host){

        List<Participant> participants = participantService.getParticipants(host);
        return participants;
    }
}
