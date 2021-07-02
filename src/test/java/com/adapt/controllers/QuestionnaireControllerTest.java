package com.adapt.controllers;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class QuestionnaireControllerTest {

    QuestionnaireController questionnaireController;

    @BeforeEach
    void setUp() {
        questionnaireController=new QuestionnaireController(null,null);
    }

    @Test
    void saveQuestionnaire() {
        questionnaireController.saveQuestionnaire(null);
    }
}
