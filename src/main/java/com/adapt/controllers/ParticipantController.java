package com.adapt.controllers;

import com.adapt.dto.Participant;
import com.adapt.dto.ParticipantStudy;
import com.adapt.dto.UpdateStatus;
import com.adapt.services.ParticipantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
    List<Participant> getParticipants(@RequestBody String host) {

        List<Participant> participants = null;
        try {
            participants = participantService.getParticipants(host);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return participants;
    }

    @PostMapping(value = "get-participant-study-list",consumes = "application/json", produces = "application/json")
    public  @ResponseBody
    List<ParticipantStudy> getParticipantStudyList(@RequestBody Participant participant) {

        List<ParticipantStudy> participantStudyList = participantService.getParticipantStudyList(participant);
        return participantStudyList;
    }

    @GetMapping(value = "get-participant-study",consumes = "application/json", produces = "application/json")
    public  @ResponseBody
    ParticipantStudy getParticipantStudy(@RequestParam Map<String, String> params) {
        String quid = params.get("quid");

        ParticipantStudy participantStudy = null;
        try {
            participantStudy = participantService.getParticipantStudy(quid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return participantStudy;

    }

    @PostMapping(value = "update-participant-study", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    UpdateStatus updateParticipantStudy(@RequestBody ParticipantStudy participantStudy) {
        return participantService.updateParticipantStudy(participantStudy);
    }

    @PostMapping("send-email")
    public @ResponseBody
    UpdateStatus sendEmail(@RequestBody ParticipantStudy participantStudy ){
       return participantService.sendMail(participantStudy);

            //return participantService.generateEmail(email, url);

    }
}
