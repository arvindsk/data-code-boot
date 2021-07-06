package com.adapt.questionnaire;

import com.google.gson.annotations.SerializedName;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
public class ElementsItem {

    @SerializedName("choicesByUrl")
    private ChoicesByUrl choicesByUrl;

    @SerializedName("isRequired")
    private boolean isRequired;

    @SerializedName("isAllRowRequired")
    private boolean isAllRowRequired;

    @SerializedName("startWithNewLine")
    private boolean startWithNewLine;

    @SerializedName("hasOther")
    private boolean hasOther;

    @SerializedName("name")
    private String name;

    @SerializedName("renderAs")
    private String renderAs;

    @SerializedName("visibleIf")
    private String visibleIf;

    @SerializedName("enableIf")
    private String enableIf;

    @SerializedName("type")
    private String type;

    @SerializedName("title")
    private String title;

    @SerializedName("choices")
    private List<ChoicesItem> choices;

    @SerializedName("columns")
    private List<ColumnsItem> columns;
    @SerializedName("rows")
    private List<RowsItem> rows;

    @SerializedName("titleLocation")
    private String titleLocation;

    @SerializedName("colCount")
    private int colCount;

    @SerializedName("description")
    private String description;

    @SerializedName("inputType")
    private String inputType;

    @SerializedName("otherText")
    private String otherText;

    @SerializedName("popupdescription")
    private String popupdescription;

    @SerializedName("defaultValue")
    private String defaultValue;

}
