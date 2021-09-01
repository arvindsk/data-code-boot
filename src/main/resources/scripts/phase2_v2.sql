ALTER TABLE
    `adaptdb`.`elements` ADD (width VARCHAR(255) DEFAULT '100%');

UPDATE adaptdb.elements SET name = '1.1', title = 'Height (ft)' where elements_id=118;
DELETE FROM adaptdb.elements WHERE elements_id IN (119, 120);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link, html, width) VALUES (119, 0, 0, '1.2', null, 'text', '(in)', 'left', 0, null, 'number', null, null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link, html, width) VALUES (120, 1, 0, '2', null, 'text', 'Weight(lbs)', 'left', 0, null, 'number', null, null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null, null, '20em');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, popupdescription, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link, html, width) VALUES (210, 1, 0, '3', null, 'text', 'Age', 'left', 0, null, 'number', null, null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null, null, '20em');

UPDATE adaptdb.elements SET width = '20em' WHERE type = 'text';

UPDATE adaptdb.elements SET width = '40em' WHERE elements_id = 80;
