package com.adapt.services;

import com.adapt.dto.LoginRequest;
import com.adapt.dto.LoginResponse;
import com.adapt.entity.SiteEntity;
import com.adapt.entity.WebusersEntity;
import com.adapt.repository.SiteEntityRepository;
import com.adapt.repository.WebusersEntityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    private final WebusersEntityRepository webusersEntityRepository;
    private final SiteEntityRepository siteEntityRepository;

    @Autowired
    public LoginService(WebusersEntityRepository webusersEntityRepository,
                        SiteEntityRepository siteEntityRepository) {
        this.webusersEntityRepository = webusersEntityRepository;
        this.siteEntityRepository = siteEntityRepository;
    }

    public LoginResponse login(LoginRequest request){
        WebusersEntity user = webusersEntityRepository.findByUsername(request.getEmailId());
        if (user!=null && user.getActive()!=null &&
                user.getUsername() != null && user.getPassword() != null) {
            if (request.getEmailId().equalsIgnoreCase(user.getUsername()) &&
                    request.getPassword().equalsIgnoreCase(user.getPassword()) &&
                    "Yes".equalsIgnoreCase(user.getActive())) {
                SiteEntity site = siteEntityRepository.findByNaccId(Integer.valueOf(user.getSiteId()));
                return new LoginResponse("success", user.getName(), user.getSitename(), site.getSiteName(), site.getNaccId());
            }
        }
        return new LoginResponse("failed","","","", Integer.valueOf(0));
    }
}
