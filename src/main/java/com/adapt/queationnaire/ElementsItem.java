package com.adapt.queationnaire;

import java.util.List;
import com.google.gson.annotations.SerializedName;

public class ElementsItem{

	@SerializedName("startWithNewLine")
	private boolean startWithNewLine;

	@SerializedName("hasOther")
	private boolean hasOther;

	@SerializedName("name")
	private String name;

	@SerializedName("visibleIf")
	private String visibleIf;

	@SerializedName("type")
	private String type;

	@SerializedName("title")
	private String title;

	@SerializedName("choices")
	private List<ChoicesItem> choices;

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
}
