package com.adapt.services;

import com.adapt.dto.LoginRequest;
import com.adapt.entity.WebusersEntity;
import com.adapt.repository.WebusersEntityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    private final WebusersEntityRepository webusersEntityRepository;

    @Autowired
    public LoginService(WebusersEntityRepository webusersEntityRepository) {
        this.webusersEntityRepository = webusersEntityRepository;
    }

    public boolean login(LoginRequest request){
        WebusersEntity user = webusersEntityRepository.findByUsername(request.getEmailId());
        if(user!=null && user.getUsername()!=null && user.getUserpass()!=null){
            if(request.getEmailId().equalsIgnoreCase(user.getUsername()) &&
                    request.getPassword().equalsIgnoreCase(user.getUserpass())) {
                return true;
            }else{
                return false;
            }
        }
        return false;
    }
}
