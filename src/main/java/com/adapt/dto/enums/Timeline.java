package com.adapt.dto.enums;

import java.util.HashMap;
import java.util.Map;

public enum Timeline {
    BASELINE(1001, "Baseline"),
    FIRST_YEAR(1002, "Firstyear"),
    THIRD_YEAR(1003, "Thirdyear");

    private final Integer timelineId;
    private final String timelineName;

    private static final Map<Integer, String> map = new HashMap<>();

    static {
        for (Timeline mapper : values()) {
            map.put(mapper.timelineId, mapper.timelineName);
        }
    }

    Timeline(final Integer timelineId, final String value) {
        this.timelineId = timelineId;
        this.timelineName = value;
    }

    public Integer getTimelineId() {
        return timelineId;
    }

    public String getTimelineName() {
        return timelineName;
    }

    public static String getTimelineNameForKey(final Integer key) {
        return map.get(key);
    }

}
