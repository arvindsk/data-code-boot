ALTER TABLE
    `adaptdb`.`elements` ADD (width VARCHAR(255) DEFAULT '100%');

UPDATE adaptdb.elements SET name = '1.1', title = 'Height (ft)' where elements_id=118;
DELETE FROM adaptdb.elements WHERE elements_id IN (119, 120);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link, html, width) VALUES (119, 0, 0, '1.2', null, 'text', '(in)', 'left', 0, null, 'number', null, null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link, html, width) VALUES (120, 1, 0, '2', null, 'text', 'Weight(lbs)', 'left', 0, null, 'number', null, null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link, html, width) VALUES (210, 1, 0, '3', null, 'text', 'Age', 'left', 0, null, 'number', null, null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null, null, '20em');

UPDATE adaptdb.elements SET width = '20em' WHERE type = 'text';

UPDATE adaptdb.elements SET width = '40em' WHERE elements_id = 80;


INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '3.2', '{3} = ''yes'' and {3.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 25, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '6.2', '{6} = ''yes'' and {6.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 26, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '8.2', '{8} = ''yes'' and {8.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 27, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '9.2', '{9} = ''yes'' and {9.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 27, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '10.2', '{10} = ''yes'' and {10.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 28, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '11.2', '{11} = ''yes'' and {11.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 28, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '12.2', '{12} = ''yes'' and {12.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 28, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '13.2', '{13} = ''yes'' and {13.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 29, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '14.2', '{14} = ''yes'' and {14.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 29, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '15.2', '{15} = ''yes'' and {15.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 29, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '16.2', '{16} = ''yes'' and {16.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 30, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '17.2', '{17} = ''yes'' and {17.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 30, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '18.2', '{18} = ''yes'' and {19.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 30, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '19.2', '{19} = ''yes'' and {19.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 31, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '20.2', '{20} = ''yes'' and {20.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 31, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '21.2', '{21} = ''yes'' and {21.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 31, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '22.2', '{22} = ''yes'' and {22.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 32, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '23.2', '{23} = ''yes'' and {23.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 32, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '24.2', '{24} = ''yes'' and {24.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 32, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '25.2', '{25} = ''yes'' and {25.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 33, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '26.2', '{26} = ''yes'' and {26.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 33, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '27.2', '{27} = ''yes'' and {27.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 33, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '28.2', '{28} = ''yes'' and {28.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 34, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '29.2', '{29} = ''yes'' and {29.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 34, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, html, image_link, width) VALUES ((SELECT MAX( elements_id ) from adaptdb.elements e)+1, 1, 0, '30.2', '{30} = ''yes'' and {30.1} notempty', 'dropdown', 'Enter how many times?', 'left', 0, null, null, null, null, 34, 16, 'http://localhost:8080/api/adapt/questionnaire/countList', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null, null, '20em');

update adaptdb.elements set choices_by_url = 'http://localhost:8080/api/adapt/questionnaire/medicine' where choices_by_url='http://localhost:8080/api/adapt/questionnaire/countList';

CREATE TABLE adaptdb.`count` (
    `count_id` int(11) NOT NULL,
    `name` int(11) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO adaptdb.count (count_id, name) VALUES (1, 1);
INSERT INTO adaptdb.count (count_id, name) VALUES (2, 2);
INSERT INTO adaptdb.count (count_id, name) VALUES (3, 3);
INSERT INTO adaptdb.count (count_id, name) VALUES (4, 4);
INSERT INTO adaptdb.count (count_id, name) VALUES (5, 5);
INSERT INTO adaptdb.count (count_id, name) VALUES (6, 6);
INSERT INTO adaptdb.count (count_id, name) VALUES (7, 7);
INSERT INTO adaptdb.count (count_id, name) VALUES (8, 8);
INSERT INTO adaptdb.count (count_id, name) VALUES (9, 9);
INSERT INTO adaptdb.count (count_id, name) VALUES (10, 10);
INSERT INTO adaptdb.count (count_id, name) VALUES (11, 11);
INSERT INTO adaptdb.count (count_id, name) VALUES (12, 12);
INSERT INTO adaptdb.count (count_id, name) VALUES (13, 13);
INSERT INTO adaptdb.count (count_id, name) VALUES (14, 14);
INSERT INTO adaptdb.count (count_id, name) VALUES (15, 15);
INSERT INTO adaptdb.count (count_id, name) VALUES (16, 16);
INSERT INTO adaptdb.count (count_id, name) VALUES (17, 17);
INSERT INTO adaptdb.count (count_id, name) VALUES (18, 18);
INSERT INTO adaptdb.count (count_id, name) VALUES (19, 19);
INSERT INTO adaptdb.count (count_id, name) VALUES (20, 20);
INSERT INTO adaptdb.count (count_id, name) VALUES (21, 21);
INSERT INTO adaptdb.count (count_id, name) VALUES (22, 22);
INSERT INTO adaptdb.count (count_id, name) VALUES (23, 23);
INSERT INTO adaptdb.count (count_id, name) VALUES (24, 24);
INSERT INTO adaptdb.count (count_id, name) VALUES (25, 25);
INSERT INTO adaptdb.count (count_id, name) VALUES (26, 26);
INSERT INTO adaptdb.count (count_id, name) VALUES (27, 27);
INSERT INTO adaptdb.count (count_id, name) VALUES (28, 28);
INSERT INTO adaptdb.count (count_id, name) VALUES (29, 29);
INSERT INTO adaptdb.count (count_id, name) VALUES (30, 30);
INSERT INTO adaptdb.count (count_id, name) VALUES (31, 31);
INSERT INTO adaptdb.count (count_id, name) VALUES (32, 32);
INSERT INTO adaptdb.count (count_id, name) VALUES (33, 33);
INSERT INTO adaptdb.count (count_id, name) VALUES (34, 34);
INSERT INTO adaptdb.count (count_id, name) VALUES (35, 35);
INSERT INTO adaptdb.count (count_id, name) VALUES (36, 36);
INSERT INTO adaptdb.count (count_id, name) VALUES (37, 37);
INSERT INTO adaptdb.count (count_id, name) VALUES (38, 38);
INSERT INTO adaptdb.count (count_id, name) VALUES (39, 39);
INSERT INTO adaptdb.count (count_id, name) VALUES (40, 40);
INSERT INTO adaptdb.count (count_id, name) VALUES (41, 41);
INSERT INTO adaptdb.count (count_id, name) VALUES (42, 42);
INSERT INTO adaptdb.count (count_id, name) VALUES (43, 43);
INSERT INTO adaptdb.count (count_id, name) VALUES (44, 44);
INSERT INTO adaptdb.count (count_id, name) VALUES (45, 45);
INSERT INTO adaptdb.count (count_id, name) VALUES (46, 46);
INSERT INTO adaptdb.count (count_id, name) VALUES (47, 47);
INSERT INTO adaptdb.count (count_id, name) VALUES (48, 48);
INSERT INTO adaptdb.count (count_id, name) VALUES (49, 49);
INSERT INTO adaptdb.count (count_id, name) VALUES (50, 50);
INSERT INTO adaptdb.count (count_id, name) VALUES (51, 51);
INSERT INTO adaptdb.count (count_id, name) VALUES (52, 52);
INSERT INTO adaptdb.count (count_id, name) VALUES (53, 53);
INSERT INTO adaptdb.count (count_id, name) VALUES (54, 54);
INSERT INTO adaptdb.count (count_id, name) VALUES (55, 55);
INSERT INTO adaptdb.count (count_id, name) VALUES (56, 56);
INSERT INTO adaptdb.count (count_id, name) VALUES (57, 57);
INSERT INTO adaptdb.count (count_id, name) VALUES (58, 58);
INSERT INTO adaptdb.count (count_id, name) VALUES (59, 59);
INSERT INTO adaptdb.count (count_id, name) VALUES (60, 60);
INSERT INTO adaptdb.count (count_id, name) VALUES (61, 61);
INSERT INTO adaptdb.count (count_id, name) VALUES (62, 62);
INSERT INTO adaptdb.count (count_id, name) VALUES (63, 63);
INSERT INTO adaptdb.count (count_id, name) VALUES (64, 64);
INSERT INTO adaptdb.count (count_id, name) VALUES (65, 65);
INSERT INTO adaptdb.count (count_id, name) VALUES (66, 66);
INSERT INTO adaptdb.count (count_id, name) VALUES (67, 67);
INSERT INTO adaptdb.count (count_id, name) VALUES (68, 68);
INSERT INTO adaptdb.count (count_id, name) VALUES (69, 69);
INSERT INTO adaptdb.count (count_id, name) VALUES (70, 70);
INSERT INTO adaptdb.count (count_id, name) VALUES (71, 71);
INSERT INTO adaptdb.count (count_id, name) VALUES (72, 72);
INSERT INTO adaptdb.count (count_id, name) VALUES (73, 73);
INSERT INTO adaptdb.count (count_id, name) VALUES (74, 74);
INSERT INTO adaptdb.count (count_id, name) VALUES (75, 75);
INSERT INTO adaptdb.count (count_id, name) VALUES (76, 76);
INSERT INTO adaptdb.count (count_id, name) VALUES (77, 77);
INSERT INTO adaptdb.count (count_id, name) VALUES (78, 78);
INSERT INTO adaptdb.count (count_id, name) VALUES (79, 79);
INSERT INTO adaptdb.count (count_id, name) VALUES (80, 80);
INSERT INTO adaptdb.count (count_id, name) VALUES (81, 81);
INSERT INTO adaptdb.count (count_id, name) VALUES (82, 82);
INSERT INTO adaptdb.count (count_id, name) VALUES (83, 83);
INSERT INTO adaptdb.count (count_id, name) VALUES (84, 84);
INSERT INTO adaptdb.count (count_id, name) VALUES (85, 85);
INSERT INTO adaptdb.count (count_id, name) VALUES (86, 86);
INSERT INTO adaptdb.count (count_id, name) VALUES (87, 87);
INSERT INTO adaptdb.count (count_id, name) VALUES (88, 88);
INSERT INTO adaptdb.count (count_id, name) VALUES (89, 89);
INSERT INTO adaptdb.count (count_id, name) VALUES (90, 90);
INSERT INTO adaptdb.count (count_id, name) VALUES (91, 91);
INSERT INTO adaptdb.count (count_id, name) VALUES (92, 92);
INSERT INTO adaptdb.count (count_id, name) VALUES (93, 93);
INSERT INTO adaptdb.count (count_id, name) VALUES (94, 94);
INSERT INTO adaptdb.count (count_id, name) VALUES (95, 95);
INSERT INTO adaptdb.count (count_id, name) VALUES (96, 96);
INSERT INTO adaptdb.count (count_id, name) VALUES (97, 97);
INSERT INTO adaptdb.count (count_id, name) VALUES (98, 98);
INSERT INTO adaptdb.count (count_id, name) VALUES (99, 99);
INSERT INTO adaptdb.count (count_id, name) VALUES (100, 100);
commit;
