package com.adapt.dto.enums;

import java.util.HashMap;
import java.util.Map;

public enum Status {NOT_STARTED(1001, "Not Started"),
    IN_PROGRESS(1002, "In-Progress"),
    SUBMITTED(1003, "Submitted"),
    NOT_ATTEMPTED(1004, "Not Attempted"),
    IN_COMPLETE(1005, "In-Complete"),
    COMPLETED(1006, "Completed"),
    READY_FOR_SUBMISSION(1007, "Ready for Submission");

    private final Integer statusId;
    private final String statusName;

    private static final Map<Integer, String> map = new HashMap<>();

    static {
        for (Status mapper : values()) {
            map.put(mapper.statusId, mapper.statusName);
        }
    }

    Status(final Integer statusId, final String value) {
        this.statusId = statusId;
        this.statusName = value;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public static String getStatusNameForKey(final Integer key) {
        return map.get(key);
    }

}
