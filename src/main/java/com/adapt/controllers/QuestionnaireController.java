package com.adapt.controllers;

import com.adapt.dto.ParticipantStudy;
import com.adapt.services.ParticipantService;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import static com.google.common.collect.Lists.newArrayList;
import static java.nio.charset.Charset.forName;

@RestController
@RequestMapping("/api/adapt/questionnaire/")
public class QuestionnaireController {
    private final ParticipantService participantService;

    public QuestionnaireController(ParticipantService participantService) {
        this.participantService = participantService;
    }


    @GetMapping("medicine")
    public List<String> testMethod1() {
        return newArrayList("dolo 650", "pan40");
    }

    @GetMapping(value = "questionnaireType", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    String getVascularQuestionnaire(@RequestParam Map<String, String> params) {
        String type = params.get("questionnaireType");

        switch (type) {
            case "vascular":
                return loadJson("questionnarie/vascular_v.1.json");
            case "diet":
                return loadJson("questionnarie/vascular_study.json");

            default:
                throw new IllegalStateException("Unexpected value: " + type);
        }

    }

    @PostMapping(value = "saveQuestionnaireFilled", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    String saveQuestionnaireFilled(@RequestBody ParticipantStudy participantStudy) {

        participantService.saveQuestionnaireFilled(participantStudy);
        return "success";
    }

    @PostMapping(value = "getQuestionnaireFilled", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    ParticipantStudy getQuestionnaireFilled(@RequestBody ParticipantStudy participantStudy) {
        return participantService.getQuestionnaireFilled(participantStudy);
    }

    private String loadJson(String path) {
        try {
            final InputStream givenInputStream = new ClassPathResource(path)
                    .getInputStream();
            return IOUtils.toString(givenInputStream, forName("UTF-8"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
