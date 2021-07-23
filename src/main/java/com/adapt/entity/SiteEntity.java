package com.adapt.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name = "site")
public class SiteEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "site_id", nullable = false)
    private Integer siteId;

    @Column(name = "site_code", nullable = false)
    private String siteCode;

    @Column(name = "site_name", nullable = false)
    private String siteName;

}
