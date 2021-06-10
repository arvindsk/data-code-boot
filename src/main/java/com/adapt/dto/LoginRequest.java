package com.adapt.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Data
@Builder
public class LoginRequest {

    private String emailId;
    private String password;

}
