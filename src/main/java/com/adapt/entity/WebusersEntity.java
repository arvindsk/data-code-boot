package com.adapt.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "webusers")
public class WebusersEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "tprefix")
    private String tprefix;

    @Column(name = "fname")
    private String fname;

    @Column(name = "lname")
    private String lname;

    @Column(name = "tsuffix")
    private String tsuffix;

    @Id
    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "userpass")
    private String userpass;

    @Column(name = "wphone")
    private String wphone;

    @Column(name = "email")
    private String email;

    @Column(name = "site")
    private String site;

    @Column(name = "active")
    private String active;

    @Column(name = "hostname")
    private String hostname;

}
