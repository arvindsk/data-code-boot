ALTER TABLE `adaptdb`.`elements`
    ADD COLUMN `min_width` VARCHAR(45) NULL DEFAULT NULL AFTER `width`,
ADD COLUMN `max_width` VARCHAR(45) NULL DEFAULT NULL AFTER `min_width`,
ADD COLUMN `input_format` VARCHAR(45) NULL DEFAULT NULL AFTER `max_width`,
ADD COLUMN `place_holder` VARCHAR(45) NULL DEFAULT NULL AFTER `input_format`;


INSERT INTO `adaptdb`.`pages` (`page_id`, `name`, `title`, `questionnaires_id`) VALUES ((SELECT MAX( page_id ) from adaptdb.pages e)+1, 'AssessmentPage', 'Assessment', '13');
INSERT INTO `adaptdb`.`pages` (`page_id`, `name`, `title`, `questionnaires_id`) VALUES ((SELECT MAX( page_id ) from adaptdb.pages e)+1, 'AssessmentPage', 'Assessment', '14');
INSERT INTO `adaptdb`.`pages` (`page_id`, `name`, `title`, `questionnaires_id`) VALUES ((SELECT MAX( page_id ) from adaptdb.pages e)+1, 'AssessmentPage', 'Assessment', '15');
INSERT INTO `adaptdb`.`pages` (`page_id`, `name`, `title`, `questionnaires_id`) VALUES ((SELECT MAX( page_id ) from adaptdb.pages e)+1, 'AssessmentPage', 'Assessment', '16');
INSERT INTO `adaptdb`.`pages` (`page_id`, `name`, `title`, `questionnaires_id`) VALUES ((SELECT MAX( page_id ) from adaptdb.pages e)+1, 'AssessmentPage', 'Assessment', '17');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width,min_width,max_width,input_format,place_holder) VALUES
    ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '8.1', null, 'datetimepicker', 'Date of Assessment', 'left', 0, null, 'text', null, null,
     (select page_id from adaptdb.pages where questionnaires_id=13 and name='AssessmentPage')
        , 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null, null, '30em','30em','30em','MM/DD/YYYY','MM/DD/YYYY');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width,min_width,max_width,input_format,place_holder) VALUES
    ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '15', null, 'datetimepicker', 'Date of Assessment', 'left', 0, null, 'text', null, null,
     (select page_id from adaptdb.pages where questionnaires_id=14 and name='AssessmentPage')
        , 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null, null, '30em','30em','30em','MM/DD/YYYY','MM/DD/YYYY');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width,min_width,max_width,input_format,place_holder) VALUES
    ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '7', null, 'datetimepicker', 'Date of Assessment', 'left', 0, null, 'text', null, null,
     (select page_id from adaptdb.pages where questionnaires_id=15 and name='AssessmentPage')
        , 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null, null, '30em','30em','30em','MM/DD/YYYY','MM/DD/YYYY');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width,min_width,max_width,input_format,place_holder) VALUES
    ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '31', null, 'datetimepicker', 'Date of Assessment', 'left', 0, null, 'text', null, null,
     (select page_id from adaptdb.pages where questionnaires_id=16 and name='AssessmentPage')
        , 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null, null, '30em','30em','30em','MM/DD/YYYY','MM/DD/YYYY');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width,min_width,max_width,input_format,place_holder) VALUES
    ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '13', null, 'datetimepicker', 'Date of Assessment', 'left', 0, null, 'text', null, null,
     (select page_id from adaptdb.pages where questionnaires_id=17 and name='AssessmentPage')
        , 17, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null, null, '30em','30em','30em','MM/DD/YYYY','MM/DD/YYYY');

commit;
