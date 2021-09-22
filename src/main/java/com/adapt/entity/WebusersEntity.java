package com.adapt.entity;

import lombok.Data;
import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Getter
@Table(name = "webusers")
public class WebusersEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "sitename")
    private String sitename;

    @Column(name = "siteID")
    private String siteId;

    @Column(name = "name")
    private String name;

    @Id
    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "email")
    private String email;

    @Column(name = "title")
    private String title;

    @Column(name = "active")
    private String active;

    @Column(name = "password")
    private String password;

    @Column(name = "userpass")
    private String userpass;


}
