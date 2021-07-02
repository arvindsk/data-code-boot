package com.adapt.questionnaire;

import com.google.gson.annotations.SerializedName;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
public class PagesItem {

    @SerializedName("elements")
    private List<ElementsItem> elements;

    @SerializedName("name")
    private String name;

    @SerializedName("title")
    private String title;
}
