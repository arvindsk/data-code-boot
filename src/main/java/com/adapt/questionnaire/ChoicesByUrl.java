package com.adapt.questionnaire;

import com.google.gson.annotations.SerializedName;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ChoicesByUrl {

    @SerializedName("url")
    private String url;
}
