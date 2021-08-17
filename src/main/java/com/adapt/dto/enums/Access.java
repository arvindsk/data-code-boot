package com.adapt.dto.enums;

import java.util.HashMap;
import java.util.Map;

public enum Access {
    ONSITE_COORDINATOR("Onsite-Coordinator", "coordinator"),
    ONSITE_PARTICIPANT("Onsite-Participant", "participant"),
    EMAIL_PARTICIPANT("Email-Participant", "email");

    private final String accessName;
    private final String accessValue;

    private static final Map<String, String> map = new HashMap<>();

    static {
        for (Access mapper : values()) {
            map.put(mapper.accessName, mapper.accessValue);
        }
    }

    Access(final String accessName, final String accessValue) {
        this.accessName = accessName;
        this.accessValue = accessValue;
    }

    public String getAccessName() {
        return accessName;
    }

    public String getAccessValue() {
        return accessValue;
    }

    public static String getAccessValueForName(final String name) {
        return map.get(name);
    }
}
