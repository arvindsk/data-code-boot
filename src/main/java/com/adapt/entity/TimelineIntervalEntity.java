package com.adapt.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "timeline_interval")
public class TimelineIntervalEntity {
    @Id
    @Column(name = "timeline_interval_id", nullable = false)
    private Integer id;

    @Column(name = "timeline_name", length = 45)
    private String timelineName;

    @Column(name = "interval_in_months")
    private Integer intervalInMonths;

    @Column(name = "comments")
    private String comments;

}
