package com.adapt.controllers;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.services.ParticipantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/adapt/collect-data/")
public class ParticipantController {

    private final ParticipantService participantService;

    @Autowired
    public ParticipantController(ParticipantService participantService) {
        this.participantService = participantService;
    }

    @PostMapping(value = "get-all-participants",consumes = "application/json", produces = "application/json")
    public  @ResponseBody
    List<Participant> getParticipants(@RequestBody String timeline) {

        List<Participant> participants = participantService.getParticipants(timeline);
        return participants;
    }

    @PostMapping(value = "get-participant-study-list",consumes = "application/json", produces = "application/json")
    public  @ResponseBody
    List<ParticipantStudy> getParticipantStudyList(@RequestBody Participant participant) {

        List<ParticipantStudy> participantStudyList = participantService.getParticipantStudyList(participant);
        return participantStudyList;
    }
}
