package com.adapt.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoginResponse {

    private String status;
    private String name;
    private String site;
}
