package com.adapt.dto.enums;

import java.util.HashMap;
import java.util.Map;

public enum Study {
    VASCULAR_RISK(1001, "Vascular Risk"),
    CARDIO_VASCULAR_RISK(1002, "Cardio Vascular Risk"),
    MEMORY(1003, "Memory"),
    DIET(1004, "Diet"),
    EXERCISE(1005, "Exercise");

    private final Integer studyId;
    private final String studyName;

    private static final Map<Integer, String> map = new HashMap<>();

    static {
        for (Study mapper : values()) {
            map.put(mapper.studyId, mapper.studyName);
        }
    }

    Study(final Integer studyId, final String value) {
        this.studyId = studyId;
        this.studyName = value;
    }

    public Integer getStudyId() {
        return studyId;
    }

    public String getStudyName() {
        return studyName;
    }

    public static String getStudyNameForKey(final Integer key) {
        return map.get(key);
    }

}
