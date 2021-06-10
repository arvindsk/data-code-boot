package com.adapt.controllers;

import com.adapt.dto.LoginRequest;
import com.adapt.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/adapt/")
public class LoginController {

    private final LoginService loginService;

    @Autowired
    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping("login")
    public String login(LoginRequest request){

        if(loginService.login(request)){
            return "success";
        }else{
            return "failed";
        }
    }
}
