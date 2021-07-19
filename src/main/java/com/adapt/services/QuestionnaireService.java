package com.adapt.services;

import com.adapt.entity.*;
import com.adapt.questionnaire.*;
import com.adapt.repository.*;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class QuestionnaireService {

    private final QuestionnairesEntityRepository questionnairesEntityRepository;
    private final PagesEntityRepository pagesEntityRepository;
    private final ElementsEntityRepository elementsEntityRepository;
    private final ChoicesEntityRepository choicesEntityRepository;
    private final ColumnsEntityRepository columnsEntityRepository;
    private final RowsEntityRepository rowsEntityRepository;
    private final QuestionnaireTriggersEntityRepository triggersEntityRepository;


    public QuestionnaireService(QuestionnairesEntityRepository questionnairesEntityRepository, PagesEntityRepository pagesEntityRepository,
                                ElementsEntityRepository elementsEntityRepository, ChoicesEntityRepository choicesEntityRepository,
                                ColumnsEntityRepository columnsEntityRepository, RowsEntityRepository rowsEntityRepository,
                                QuestionnaireTriggersEntityRepository triggersEntityRepository) {
        this.questionnairesEntityRepository = questionnairesEntityRepository;
        this.pagesEntityRepository = pagesEntityRepository;
        this.elementsEntityRepository = elementsEntityRepository;
        this.choicesEntityRepository = choicesEntityRepository;
        this.columnsEntityRepository = columnsEntityRepository;
        this.rowsEntityRepository = rowsEntityRepository;
        this.triggersEntityRepository=triggersEntityRepository;
    }

    public void saveQuestionnaire(Questionnaire questionnaire, int studyId) {
        QuestionnairesEntity questionnairesEntity = QuestionnairesEntity.builder()
                .showProgressBar(questionnaire.getShowProgressBar())
                .showPageTitles(questionnaire.isShowPageTitles())
                .showQuestionNumbers(questionnaire.getShowQuestionNumbers())
                .completedHtml(questionnaire.getCompletedHtml())
                .title(questionnaire.getTitle())
                //.questionType(questionnaire.getQuestionType())
                .showPreviewBeforeComplete(questionnaire.getShowPreviewBeforeComplete())
                .checkErrorsMode(questionnaire.getCheckErrorsMode())
                .studyId(studyId)
                //.pages(getPagesEntity(questionnaire.getPages()))
                .build();

        questionnairesEntityRepository.saveAndFlush(questionnairesEntity);
        QuestionnairesEntity updatedEntity = questionnairesEntityRepository.saveAndFlush(questionnairesEntity);
        //updatedEntity.setPages(updatedPages(questionnaire.getPages(),updatedEntity));
        updatedPages(questionnaire.getPages(), updatedEntity);
        updateTriggers(questionnaire.getTriggers(),updatedEntity);

        // questionnairesEntityRepository.saveAndFlush(updatedEntity);

    }

    private void updateTriggers(List<TriggersItem> triggers, QuestionnairesEntity updatedEntity) {

        for (TriggersItem triggersItem : triggers) {
            QuestionnaireTriggersEntity triggersEntity = QuestionnaireTriggersEntity.builder()
                    .expression(triggersItem.getExpression())
                    .setValue(triggersItem.getSetValue())
                    .setToName(triggersItem.getSetToName())
                    .type(triggersItem.getSetValue())
                    .questionnairesEntity(updatedEntity)
                    //.elementsEntities(getElementEntity(triggersItem.getElements()))
                    .build();
            QuestionnaireTriggersEntity updatedPagesEntity = this.triggersEntityRepository.saveAndFlush(triggersEntity);
        }
    }

    private void updatedPages(List<PagesItem> pages, QuestionnairesEntity updatedEntity) {

        for (PagesItem pagesItem : pages) {
            PagesEntity pagesEntity = PagesEntity.builder()
                    .name(pagesItem.getName())
                    .title(pagesItem.getTitle())
                    .questionnairesEntity(updatedEntity)
                    //.elementsEntities(getElementEntity(pagesItem.getElements()))
                    .build();
            PagesEntity updatedPagesEntity = this.pagesEntityRepository.saveAndFlush(pagesEntity);
            updateElementEntity(pagesItem.getElements(), updatedPagesEntity);
        }


    }

    private void updateElementEntity(List<ElementsItem> elements, PagesEntity pagesEntity) {


        for (ElementsItem elementsItem : elements) {
            ElementsEntity elementsEntity = ElementsEntity.builder()
                    .startWithNewLine(elementsItem.isStartWithNewLine())
                    .hasOther(elementsItem.isHasOther())
                    .required(elementsItem.isRequired())
                    .name(elementsItem.getName())
                    .visibleIf(elementsItem.getVisibleIf())
                    .type(elementsItem.getType())
                    .title(elementsItem.getTitle())
                    .titleLocation(elementsItem.getTitleLocation())
                    .colCount(elementsItem.getColCount())
                    .description(elementsItem.getDescription())
                    .inputType(elementsItem.getInputType())
                    .otherText(elementsItem.getOtherText())
                    .popupdescription(elementsItem.getPopupdescription())
                    .choicesByUrl(getUrl(elementsItem))
                    .renderAs(elementsItem.getRenderAs())
                    .allRowRequired(elementsItem.isAllRowRequired())
                    .defaultValue(elementsItem.getDefaultValue())
                    .min(elementsItem.getMin())
                    .max(elementsItem.getMax())
                    .requiredIf(elementsItem.getRequiredIf())
                    .indent(elementsItem.getIndent())
                    .imageLink(elementsItem.getImageLink())
                    .imageWidth(elementsItem.getImageWidth())
                    .imageHeight(elementsItem.getImageHeight())
                    .html(elementsItem.getHtml())
                    .pagesEntity(pagesEntity)
                    //.choices(getChoicesEntity(elementsItem.getChoices()))
                    //.rows(getRowsEntity(elementsItem.getRows()))
                    //.columns(getColumnsEntity(elementsItem.getColumns()))
                    .questionnairesId(pagesEntity.getQuestionnairesEntity().getQuestionnairesId())
                    .build();
            ElementsEntity updatedElementsEntity = elementsEntityRepository.saveAndFlush(elementsEntity);
            updateChoicesEntity(elementsItem.getChoices(), updatedElementsEntity);
            updateColumnsEntity(elementsItem.getColumns(), updatedElementsEntity);
            updateRowsEntity(elementsItem.getRows(), updatedElementsEntity);
        }
    }

    private String getUrl(ElementsItem elementsItem) {
        return Objects.nonNull(elementsItem.getChoicesByUrl()) ? elementsItem.getChoicesByUrl().getUrl() : null;
    }

    private void updateChoicesEntity(List<ChoicesItem> choices, ElementsEntity updatedElementsEntity) {
        if (Objects.nonNull(choices) && !choices.isEmpty()) {
            for (ChoicesItem choicesItem : choices) {
                ChoicesEntity choicesEntity = ChoicesEntity.builder()
                        .name(choicesItem.getText())
                        .value(choicesItem.getValue())
                        .elementsEntity(updatedElementsEntity)
                        .build();
                choicesEntityRepository.saveAndFlush(choicesEntity);
            }

        }

    }

    private void updateColumnsEntity(List<ColumnsItem> columns, ElementsEntity updatedElementsEntity) {
        if (Objects.nonNull(columns) && !columns.isEmpty()) {
            for (ColumnsItem columnsItem : columns) {
                ColumnsEntity columnsEntity = ColumnsEntity.builder()
                        .name(columnsItem.getText())
                        .value(columnsItem.getValue())
                        .elementsEntity(updatedElementsEntity)
                        .build();
                columnsEntityRepository.saveAndFlush(columnsEntity);
            }

        }

    }

    private void updateRowsEntity(List<RowsItem> rows, ElementsEntity updatedElementsEntity) {
        if (Objects.nonNull(rows) && !rows.isEmpty()) {
            for (RowsItem rowsItem : rows) {
                RowsEntity rowsEntity = RowsEntity.builder()
                        .name(rowsItem.getText())
                        .value(rowsItem.getValue())
                        .elementsEntity(updatedElementsEntity)
                        .build();
                rowsEntityRepository.saveAndFlush(rowsEntity);
            }
        }

    }

    public Questionnaire getQuestionnaire(Integer studyId) {
        try {
            QuestionnairesEntity questionnaireEntity = questionnairesEntityRepository.findQuestionnairesEntitiesByStudyId(studyId);

            return Questionnaire.builder()
                    .showProgressBar(questionnaireEntity.getShowProgressBar())
                    .showPageTitles(questionnaireEntity.isShowPageTitles())
                    .showQuestionNumbers(questionnaireEntity.getShowQuestionNumbers())
                    .completedHtml(questionnaireEntity.getCompletedHtml())
                    .title(questionnaireEntity.getTitle())
                  //  .questionType(questionnaireEntity.getQuestionType())
                    .showPreviewBeforeComplete(questionnaireEntity.getShowPreviewBeforeComplete())
                    .checkErrorsMode(questionnaireEntity.getCheckErrorsMode())
                    .pages(getPagesEntity(questionnaireEntity.getPages()))
                    .triggers(getTriggers(questionnaireEntity.getTriggers()))
                    .build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<TriggersItem> getTriggers(Set<QuestionnaireTriggersEntity> triggers) {
        if (Objects.nonNull(triggers) && !triggers.isEmpty()) {
            Comparator<QuestionnaireTriggersEntity> idComparator = Comparator.comparing(QuestionnaireTriggersEntity::getQuestionnaireTriggerId);
            List<QuestionnaireTriggersEntity> sortedTriggers = triggers.stream().sorted(idComparator).collect(Collectors.toList());
            return sortedTriggers.stream().map(triggersEntity -> TriggersItem.builder()
                    .expression(triggersEntity.getExpression())
                    .setToName(triggersEntity.getSetToName())
                    .setValue(triggersEntity.getSetValue())
                    .type(triggersEntity.getType())
                    .build()).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    private List<PagesItem> getPagesEntity(Set<PagesEntity> pages) {


        if (Objects.nonNull(pages) && !pages.isEmpty()) {
            Comparator<PagesEntity> idComparator = Comparator.comparing(PagesEntity::getPageId);
            List<PagesEntity> sortedPages = pages.stream().sorted(idComparator).collect(Collectors.toList());
            return sortedPages.stream().map(pagesEntity -> PagesItem.builder()
                    .name(pagesEntity.getName())
                    .title(pagesEntity.getTitle())
                    .elements(getElements(pagesEntity.getElementsEntities()))
                    .build()).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    private List<ElementsItem> getElements(Set<ElementsEntity> elementsEntities) {

        if (Objects.nonNull(elementsEntities) && !elementsEntities.isEmpty()) {
            Comparator<ElementsEntity> idComparator = Comparator.comparing(ElementsEntity::getElementsId);
            List<ElementsEntity> sortedEntities = elementsEntities.stream().sorted(idComparator).collect(Collectors.toList());
            return sortedEntities.stream().map(elementsEntity -> ElementsItem.builder()
                    .startWithNewLine(elementsEntity.isStartWithNewLine())
                    .hasOther(elementsEntity.isHasOther())
                    .isRequired(elementsEntity.isRequired())
                    .name(elementsEntity.getName())
                    .visibleIf(elementsEntity.getVisibleIf())
                    .type(elementsEntity.getType())
                    .title(elementsEntity.getTitle())
                    .titleLocation(elementsEntity.getTitleLocation())
                    .colCount(elementsEntity.getColCount())
                    .description(elementsEntity.getDescription())
                    .inputType(elementsEntity.getInputType())
                    .otherText(elementsEntity.getOtherText())
                    .popupdescription(elementsEntity.getPopupdescription())
                    .choicesByUrl(getChoicesByUrl(elementsEntity))
                    .isAllRowRequired(elementsEntity.isAllRowRequired())
                    .min(elementsEntity.getMin())
                    .max(elementsEntity.getMax())
                    .requiredIf(elementsEntity.getRequiredIf())
                    .indent(elementsEntity.getIndent())
                    .imageLink(elementsEntity.getImageLink())
                    .imageHeight(elementsEntity.getImageHeight())
                    .imageWidth(elementsEntity.getImageWidth())
                    .html(elementsEntity.getHtml())
                    .defaultValue(elementsEntity.getDefaultValue())
                    .choices(getChoices(elementsEntity.getChoices()))
                    .rows(getRows(elementsEntity.getRows()))
                    .columns(getColumns(elementsEntity.getColumns()))
                    .build()).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    private List<ColumnsItem> getColumns(Set<ColumnsEntity> columnsEntities) {
        if (Objects.nonNull(columnsEntities) && !columnsEntities.isEmpty()) {
            Comparator<ColumnsEntity> idComparator = Comparator.comparing(ColumnsEntity::getColumnId);
            List<ColumnsEntity> sortedEntities = columnsEntities.stream().sorted(idComparator).collect(Collectors.toList());
            return sortedEntities.stream().map(columnsEntity -> ColumnsItem.builder()
                    .text(columnsEntity.getName())
                    .value(columnsEntity.getValue())
                    .build()).collect(Collectors.toList());

        }

        return new ArrayList<>();
    }

    private List<RowsItem> getRows(Set<RowsEntity> rowsEntities) {
        if (Objects.nonNull(rowsEntities) && !rowsEntities.isEmpty()) {
            Comparator<RowsEntity> idComparator = Comparator.comparing(RowsEntity::getRowId);
            List<RowsEntity> sortedEntities = rowsEntities.stream().sorted(idComparator).collect(Collectors.toList());
            return sortedEntities.stream().map(rowsEntity -> RowsItem.builder()
                    .text(rowsEntity.getName())
                    .value(rowsEntity.getValue())
                    .build()).collect(Collectors.toList());

        }
        return new ArrayList<>();
    }

    private List<ChoicesItem> getChoices(Set<ChoicesEntity> choices) {
        if (Objects.nonNull(choices) && !choices.isEmpty()) {
            Comparator<ChoicesEntity> idComparator = Comparator.comparing(ChoicesEntity::getChioceId);
            List<ChoicesEntity> sortedEntities = choices.stream().sorted(idComparator).collect(Collectors.toList());
            return sortedEntities.stream().map(choicesEntity -> ChoicesItem.builder()
                    .text(choicesEntity.getName())
                    .value(choicesEntity.getValue())
                    .build()).collect(Collectors.toList());

        }
        return new ArrayList<>();
    }

    private ChoicesByUrl getChoicesByUrl(ElementsEntity elementsEntity) {
        return Objects.nonNull(elementsEntity.getChoicesByUrl()) ? ChoicesByUrl.builder()
                .url(elementsEntity.getChoicesByUrl()).build() : null;
    }
}
