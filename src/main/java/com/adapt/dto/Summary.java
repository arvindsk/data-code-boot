package com.adapt.dto;

import com.adapt.dto.enums.Study;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Summary {
    private int participantCount;
    private List<SummaryMap> baselineStudySummary;
    private List<SummaryMap> firstyearStudySummary;
    private List<SummaryMap> thirdyearStudySummary;
}
