package com.adapt.dto;

import com.adapt.dto.enums.StatusFlag;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateStatus {
    private StatusFlag status = StatusFlag.FAILURE;
    private String message;
}
