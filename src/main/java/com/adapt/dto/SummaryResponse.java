package com.adapt.dto;

import lombok.*;

import java.util.Map;

@Getter
@Setter
public class SummaryResponse {
    private Long participantCount;
    private Map<String, Long> studySummary;
}
