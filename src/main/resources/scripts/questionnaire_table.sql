DROP TABLE `adapt_dev`.`questionnaire`;
DROP TABLE `adapt_dev`.`questionnaire_sequence`;
DROP TABLE `adapt_dev`.`rows`;
DROP TABLE `adapt_dev`.`choices``;
DROP TABLE `adapt_dev`.`columns`;
DROP TABLE `adapt_dev`.`elements`;
DROP TABLE `adapt_dev`.`pages`;
DROP TABLE `adapt_dev`.`questionnaires`;

CREATE TABLE `questionnaires` (
  `questionnaires_id` int(11) NOT NULL AUTO_INCREMENT,
  `show_progress_bar` varchar(45) DEFAULT NULL,
  `show_page_titles` tinyint(4) DEFAULT NULL,
  `show_question_numbers` varchar(45) DEFAULT NULL,
  `completed_html` blob,
  `title` varchar(500) DEFAULT NULL,
  `question_type` varchar(255) NOT NULL,
  `show_preview_before_complete` varchar(255) DEFAULT NULL,
  `check_errors_mode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`questionnaires_id`),
  UNIQUE KEY `question_type_UNIQUE` (`question_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `questionnaires_id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`questionnaires_id`),
  KEY `questionnaires_id_idx` (`questionnaires_id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `questionnaires_id` FOREIGN KEY (`questionnaires_id`) REFERENCES `questionnaires` (`questionnaires_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1

CREATE TABLE `elements` (
    `elements_id` int(11) NOT NULL AUTO_INCREMENT,
    `start_with_new_line` tinyint(4) DEFAULT NULL,
    `has_other` tinyint(4) DEFAULT NULL,
    `name` varchar(255) NOT NULL,
    `visible_if` varchar(255) DEFAULT NULL,
    `type` varchar(255) NOT NULL,
    `title` varchar(500) DEFAULT NULL,
    `title_location` varchar(45) DEFAULT NULL,
    `col_count` int(11) DEFAULT NULL,
    `description` longtext,
    `input_type` varchar(255) DEFAULT NULL,
    `other_text` varchar(255) DEFAULT NULL,
    `popupdescription` blob,
    `page_id` int(11) NOT NULL,
    `questionnaires_id` int(11) NOT NULL,
    `choices_by_url` varchar(255) DEFAULT NULL,
    `is_required` tinyint(4) DEFAULT '0',
    `enable_if` varchar(255) DEFAULT NULL,
    `render_as` varchar(255) DEFAULT NULL,
    `is_all_row_required` tinyint(4) DEFAULT '0',
    PRIMARY KEY (`name`,`questionnaires_id`),
    KEY `elements_id` (`elements_id`),
    KEY `page_id_idx` (`elements_id`,`page_id`),
    KEY `page_id_idx1` (`page_id`),
    KEY `questionnaires_id_idx` (`questionnaires_id`),
    CONSTRAINT `elements_fk2` FOREIGN KEY (`questionnaires_id`) REFERENCES `questionnaires` (`questionnaires_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `page_id_fk` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

CREATE TABLE `choices` (
  `chioce_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `elements_id` int(11) NOT NULL,
  PRIMARY KEY (`chioce_id`),
  KEY `elements_id_idx` (`elements_id`),
  CONSTRAINT `elements_id` FOREIGN KEY (`elements_id`) REFERENCES `elements` (`elements_id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1

CREATE TABLE `columns` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `elements_id` int(11) NOT NULL,
  PRIMARY KEY (`column_id`),
  KEY `columns_elements_id_fk` (`elements_id`),
  CONSTRAINT `columns_elements_id_fk` FOREIGN KEY (`elements_id`) REFERENCES `elements` (`elements_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `rows` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `elements_id` int(11) NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `rows_elements_id_fk` (`elements_id`),
  CONSTRAINT `rows_elements_id_fk` FOREIGN KEY (`elements_id`) REFERENCES `elements` (`elements_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
