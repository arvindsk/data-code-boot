package com.adapt.controllers;

import com.adapt.dto.Participant;
import com.adapt.services.ParticipantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/adapt/collect-data/")
public class ParticipantController {

    private final ParticipantService participantService;

    @Autowired
    public ParticipantController(ParticipantService participantService) {
        this.participantService = participantService;
    }

    @GetMapping(value = "get-all-participants",consumes = "application/json", produces = "application/json")
    public  @ResponseBody
    List<Participant> getParticipants(String host) {

        List<Participant> participants = participantService.getParticipants(host);
        return participants;
    }
}
