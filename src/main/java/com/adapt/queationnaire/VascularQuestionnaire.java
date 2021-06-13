package com.adapt.queationnaire;

import java.util.List;
import com.google.gson.annotations.SerializedName;

public class VascularQuestionnaire{

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
}
