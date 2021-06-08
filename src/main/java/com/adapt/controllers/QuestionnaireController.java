package com.adapt.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/adapt/")
public class QuestionnaireController {

    @GetMapping("test")
    public String testMethod(){
        return "success";
    }
}
