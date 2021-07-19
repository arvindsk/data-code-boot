package com.adapt.questionnaire;

import com.adapt.entity.QuestionnairesEntity;
import com.google.gson.annotations.SerializedName;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Data
@Builder
public class TriggersItem{

	@SerializedName("expression")
	private String expression;

	@SerializedName("setToName")
	private String setToName;

	@SerializedName("setValue")
	private String setValue;

	@SerializedName("type")
	private String type;

	@ManyToOne(fetch = FetchType.LAZY)
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	@JoinColumn(name = "questionnaires_id", referencedColumnName = "questionnaires_id")
	private QuestionnairesEntity questionnairesEntity;
}
