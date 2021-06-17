package com.adapt.controllers;

import com.adapt.dto.Summary;
import com.adapt.services.SummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/adapt/summary/")
public class SummaryController {

    private final SummaryService summaryService;

    @Autowired
    public SummaryController(SummaryService summaryService) {
        this.summaryService = summaryService;
    }

    @GetMapping(value = "get-summary", consumes = "application/json", produces = "application/json")
    public  @ResponseBody
    Summary summary(){
        return summaryService.summary(null);
    }
}
