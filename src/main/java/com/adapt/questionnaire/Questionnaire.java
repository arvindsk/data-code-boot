package com.adapt.questionnaire;

import com.google.gson.annotations.SerializedName;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class Questionnaire {

    @SerializedName("showProgressBar")
    private String showProgressBar;

    @SerializedName("showPageTitles")
    private boolean showPageTitles;

    @SerializedName("pages")
    private List<PagesItem> pages;

    @SerializedName("showQuestionNumbers")
    private String showQuestionNumbers;

    @SerializedName("title")
    private String title;

    @SerializedName("completedHtml")
    private String completedHtml;

    @SerializedName("showPreviewBeforeComplete")
    private String showPreviewBeforeComplete;

    @SerializedName("checkErrorsMode")
    private String checkErrorsMode;

    private String questionType;

    @SerializedName("triggers")
    private List<TriggersItem> triggers;
}
