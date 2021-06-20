package com.adapt.controllers;

import com.adapt.dto.LoginRequest;
import com.adapt.dto.LoginResponse;
import com.adapt.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/adapt/login/")
public class LoginController {

    private final LoginService loginService;

    @Autowired
    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @PostMapping(value = "loginuser", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    LoginResponse login(@RequestBody LoginRequest request){
        return loginService.login(request);
    }
}
