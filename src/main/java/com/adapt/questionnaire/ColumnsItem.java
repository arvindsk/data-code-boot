package com.adapt.questionnaire;

import com.google.gson.annotations.SerializedName;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class ColumnsItem {

    @SerializedName("text")
    private String text;

    @SerializedName("value")
    private String value;
}
