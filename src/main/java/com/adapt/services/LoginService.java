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
        if (user!=null && user.getUsername() != null && user.getUserpass() != null) {
            if (request.getEmailId().equalsIgnoreCase(user.getUsername()) &&
                    request.getPassword().equalsIgnoreCase(user.getUserpass())) {
                SiteEntity site = siteEntityRepository.findBySiteCode(user.getSite());
                return new LoginResponse("success", user.getFname(), user.getSite(), site.getSiteName());
            }
        }
        return new LoginResponse("failed","","","");
    }
}
