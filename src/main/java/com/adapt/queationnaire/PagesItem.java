package com.adapt.queationnaire;

import java.util.List;
import com.google.gson.annotations.SerializedName;

public class PagesItem{

	@SerializedName("elements")
	private List<ElementsItem> elements;

	@SerializedName("name")
	private String name;

	@SerializedName("title")
	private String title;
}
