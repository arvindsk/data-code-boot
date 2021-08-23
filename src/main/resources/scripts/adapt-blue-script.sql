DROP DATABASE IF EXISTS adaptdb;
CREATE DATABASE adaptdb;
CREATE TABLE adaptdb.choices (choice_id int NOT NULL AUTO_INCREMENT, name varchar(255), value varchar(255), elements_id int NOT NULL, PRIMARY KEY (choice_id), INDEX elements_id_idx (elements_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
CREATE TABLE adaptdb.elements (elements_id int NOT NULL AUTO_INCREMENT, startWithNewLine tinyint, hasOther tinyint, name varchar(255) NOT NULL, visibleIf varchar(255), type varchar(255) NOT NULL, title varchar(500), titleLocation varchar(45), colCount int, description longtext, inputType varchar(255), otherText varchar(255), popupdescription blob, page_id int NOT NULL, questionnaires_id int NOT NULL, PRIMARY KEY (name, questionnaires_id), INDEX elements_id (elements_id), INDEX page_id_idx (elements_id, page_id), INDEX page_id_idx1 (page_id), INDEX questionnaires_id_idx (questionnaires_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
CREATE TABLE adaptdb.pages (page_id int NOT NULL AUTO_INCREMENT, name varchar(255) NOT NULL, title varchar(255), questionnaires_id int NOT NULL, PRIMARY KEY (name, questionnaires_id), CONSTRAINT name_UNIQUE UNIQUE (name), INDEX questionnaires_id_idx (questionnaires_id), INDEX page_id (page_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
CREATE TABLE adaptdb.participant_study (participant_study_id int NOT NULL AUTO_INCREMENT, participant_id int NOT NULL, study_information longtext, timeline varchar(255), study_id int, status varchar(255), completed_time timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL, access VARCHAR(255), quid VARCHAR(255), PRIMARY KEY (participant_study_id), INDEX participant_study_FK_1 (study_id), INDEX participant_study_FK_2 (participant_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
CREATE TABLE adaptdb.participants (participant_id int NOT NULL AUTO_INCREMENT, autotime timestamp DEFAULT CURRENT_TIMESTAMP, logid varchar(15), loghost varchar(20), first_name varchar(255) NOT NULL, last_name varchar(255) NOT NULL, naccID varchar(45) NOT NULL, gender varchar(45) NOT NULL, race varchar(255) NOT NULL, ethnicity varchar(255) NOT NULL, dob varchar(45) NOT NULL, ques1 varchar(45) NOT NULL, ques2 varchar(45) NOT NULL, ques3 varchar(45) NOT NULL, ques4 varchar(45) NOT NULL, autolog timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, revlogid varchar(15), revloghost varchar(40), PRIMARY KEY (participant_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
DROP TABLE IF EXISTS adaptdb.questionnaire;
CREATE TABLE adaptdb.questionnaire (questionnaire_id int NOT NULL AUTO_INCREMENT, questionnaire_type varchar(45), questions longtext, PRIMARY KEY (questionnaire_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
DROP TABLE IF EXISTS adapt.questionnaire_sequence;
CREATE TABLE adaptdb.questionnaire_sequence (questionnaire_sequence_id binary(16) NOT NULL, question_id binary(16), answer varchar(255), next_question_id binary(16), PRIMARY KEY (questionnaire_sequence_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
DROP TABLE IF EXISTS adaptdb.questionnaires;
CREATE TABLE adaptdb.questionnaires (questionnaires_id int NOT NULL AUTO_INCREMENT, showProgressBar varchar(45), showPageTitles tinyint, showQuestionNumbers varchar(45), completedHtml blob, title varchar(500), question_type varchar(255) NOT NULL, PRIMARY KEY (questionnaires_id), CONSTRAINT question_type_UNIQUE UNIQUE (question_type)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
DROP TABLE IF EXISTS adaptdb.study;
CREATE TABLE adaptdb.study (study_id int NOT NULL, study_name varchar(255), PRIMARY KEY (study_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
INSERT INTO adaptdb.study (study_id, study_name) VALUES (1001, 'Vascular Risk');
INSERT INTO adaptdb.study (study_id, study_name) VALUES (1002, 'Sleep');
INSERT INTO adaptdb.study (study_id, study_name) VALUES (1003, 'Everyday Cognition (E-Cog)');
INSERT INTO adaptdb.study (study_id, study_name) VALUES (1004, 'Diet Screening');
INSERT INTO adaptdb.study (study_id, study_name) VALUES (1005, 'Physical Activity Screening');
DROP TABLE IF EXISTS adaptdb.webroles;
CREATE TABLE adaptdb.webroles (username varchar(100) NOT NULL, rolename varchar(20) NOT NULL, PRIMARY KEY (username, rolename)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
DROP TABLE IF EXISTS adaptdb.webusers;
CREATE TABLE adaptdb.webusers (id int(10) unsigned NOT NULL AUTO_INCREMENT, tprefix varchar(5), fname varchar(20), lname varchar(20), tsuffix varchar(5), username varchar(100) NOT NULL, userpass varchar(15), wphone varchar(16), email varchar(100), site varchar(100), active varchar(1) DEFAULT 'Y', hostname varchar(50), PRIMARY KEY (username), CONSTRAINT rowno UNIQUE (id)) ENGINE=InnoDB DEFAULT CHARSET=latin1 DEFAULT COLLATE=latin1_swedish_ci;
ALTER TABLE adaptdb.elements ADD CONSTRAINT elements_fk2 FOREIGN KEY (questionnaires_id) REFERENCES adaptdb.questionnaires (questionnaires_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE adaptdb.elements ADD CONSTRAINT page_id FOREIGN KEY (page_id) REFERENCES adaptdb.pages (page_id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE adaptdb.pages ADD CONSTRAINT questionnaires_id FOREIGN KEY (questionnaires_id) REFERENCES adaptdb.questionnaires (questionnaires_id);
ALTER TABLE adaptdb.participant_study ADD CONSTRAINT participant_study_FK_1 FOREIGN KEY (study_id) REFERENCES adaptdb.study (study_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE adaptdb.participant_study ADD CONSTRAINT participant_study_FK_2 FOREIGN KEY (participant_id) REFERENCES adaptdb.participants (participant_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE adaptdb.webroles ADD CONSTRAINT webroles_FK_1 FOREIGN KEY (username) REFERENCES adaptdb.webusers (username) ON DELETE CASCADE ON UPDATE CASCADE;
DROP TABLE IF EXISTS adaptdb.medicine_list;
CREATE TABLE adaptdb.medicine_list (
  medicine_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(300) DEFAULT NULL,
  PRIMARY KEY (medicine_id)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1;

INSERT INTO medicine_list (medicine_id, name) VALUES (1, 'No prescribed medications');
INSERT INTO medicine_list (medicine_id, name) VALUES (2, 'Acarbose');
INSERT INTO medicine_list (medicine_id, name) VALUES (3, 'Accupril');
INSERT INTO medicine_list (medicine_id, name) VALUES (4, 'Acebutolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (5, 'Aceon');
INSERT INTO medicine_list (medicine_id, name) VALUES (6, 'Acetazolamide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (7, 'Actos');
INSERT INTO medicine_list (medicine_id, name) VALUES (8, 'Adalat');
INSERT INTO medicine_list (medicine_id, name) VALUES (9, 'Aldactazide');
INSERT INTO medicine_list (medicine_id, name) VALUES (10, 'Aldactone');
INSERT INTO medicine_list (medicine_id, name) VALUES (11, 'Aldomet');
INSERT INTO medicine_list (medicine_id, name) VALUES (12, 'Aldoril');
INSERT INTO medicine_list (medicine_id, name) VALUES (13, 'Altace');
INSERT INTO medicine_list (medicine_id, name) VALUES (14, 'Amaryl');
INSERT INTO medicine_list (medicine_id, name) VALUES (15, 'Amiloride + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (16, 'Amiloride hydrochloride ');
INSERT INTO medicine_list (medicine_id, name) VALUES (17, 'Amlodipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (18, 'Amlodipine + benazepril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (19, 'Antara');
INSERT INTO medicine_list (medicine_id, name) VALUES (20, 'Apresazide');
INSERT INTO medicine_list (medicine_id, name) VALUES (21, 'Apresoline');
INSERT INTO medicine_list (medicine_id, name) VALUES (22, 'Aranesp');
INSERT INTO medicine_list (medicine_id, name) VALUES (23, 'Aspirin');
INSERT INTO medicine_list (medicine_id, name) VALUES (24, 'Atacand');
INSERT INTO medicine_list (medicine_id, name) VALUES (25, 'Atenolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (26, 'Atenolol + chlorthalidone ');
INSERT INTO medicine_list (medicine_id, name) VALUES (27, 'atorvastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (28, 'Avandia');
INSERT INTO medicine_list (medicine_id, name) VALUES (29, 'Avapro');
INSERT INTO medicine_list (medicine_id, name) VALUES (30, 'Benazepril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (31, 'Benazepril + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (32, 'Bepridil ');
INSERT INTO medicine_list (medicine_id, name) VALUES (33, 'Betapace');
INSERT INTO medicine_list (medicine_id, name) VALUES (34, 'Betaxolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (35, 'Bisoprolol + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (36, 'Bisoprolol/hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (37, 'Blocadren');
INSERT INTO medicine_list (medicine_id, name) VALUES (38, 'Bumetanide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (39, 'Bumex');
INSERT INTO medicine_list (medicine_id, name) VALUES (40, 'Byetta');
INSERT INTO medicine_list (medicine_id, name) VALUES (41, 'Caduet');
INSERT INTO medicine_list (medicine_id, name) VALUES (42, 'Calan');
INSERT INTO medicine_list (medicine_id, name) VALUES (43, 'Calcitriol');
INSERT INTO medicine_list (medicine_id, name) VALUES (44, 'Calcium Carbonate');
INSERT INTO medicine_list (medicine_id, name) VALUES (45, 'Caltrate');
INSERT INTO medicine_list (medicine_id, name) VALUES (46, 'Candesartan ');
INSERT INTO medicine_list (medicine_id, name) VALUES (47, 'Capoten');
INSERT INTO medicine_list (medicine_id, name) VALUES (48, 'Capozide');
INSERT INTO medicine_list (medicine_id, name) VALUES (49, 'Captopril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (50, 'Captopril + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (51, 'Cardene');
INSERT INTO medicine_list (medicine_id, name) VALUES (52, 'Cardizem');
INSERT INTO medicine_list (medicine_id, name) VALUES (53, 'Cardura');
INSERT INTO medicine_list (medicine_id, name) VALUES (54, 'Carteolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (55, 'Cartrol');
INSERT INTO medicine_list (medicine_id, name) VALUES (56, 'Carvedilol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (57, 'Catapres');
INSERT INTO medicine_list (medicine_id, name) VALUES (58, 'Chlorothiazide');
INSERT INTO medicine_list (medicine_id, name) VALUES (59, 'Chlorthalidone ');
INSERT INTO medicine_list (medicine_id, name) VALUES (60, 'cholestyramine');
INSERT INTO medicine_list (medicine_id, name) VALUES (61, 'Clonidine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (62, 'Clopidogrel');
INSERT INTO medicine_list (medicine_id, name) VALUES (63, 'Clorpres');
INSERT INTO medicine_list (medicine_id, name) VALUES (64, 'colesevelam');
INSERT INTO medicine_list (medicine_id, name) VALUES (65, 'Colestid');
INSERT INTO medicine_list (medicine_id, name) VALUES (66, 'colestipol');
INSERT INTO medicine_list (medicine_id, name) VALUES (67, 'Coreg');
INSERT INTO medicine_list (medicine_id, name) VALUES (68, 'Corgard');
INSERT INTO medicine_list (medicine_id, name) VALUES (69, 'Corzide');
INSERT INTO medicine_list (medicine_id, name) VALUES (70, 'Coumadin');
INSERT INTO medicine_list (medicine_id, name) VALUES (71, 'Covera');
INSERT INTO medicine_list (medicine_id, name) VALUES (72, 'Cozaar');
INSERT INTO medicine_list (medicine_id, name) VALUES (73, 'Crestor');
INSERT INTO medicine_list (medicine_id, name) VALUES (74, 'Dalteparin');
INSERT INTO medicine_list (medicine_id, name) VALUES (75, 'Danaparoid');
INSERT INTO medicine_list (medicine_id, name) VALUES (76, 'darbepoetin alfa');
INSERT INTO medicine_list (medicine_id, name) VALUES (77, 'Demadex');
INSERT INTO medicine_list (medicine_id, name) VALUES (78, 'Dexferrum');
INSERT INTO medicine_list (medicine_id, name) VALUES (79, 'DiaBeta');
INSERT INTO medicine_list (medicine_id, name) VALUES (80, 'Diamox');
INSERT INTO medicine_list (medicine_id, name) VALUES (81, 'Digoxin');
INSERT INTO medicine_list (medicine_id, name) VALUES (82, 'Dilacor');
INSERT INTO medicine_list (medicine_id, name) VALUES (83, 'Diltiazem ');
INSERT INTO medicine_list (medicine_id, name) VALUES (84, 'Diovan');
INSERT INTO medicine_list (medicine_id, name) VALUES (85, 'Dipyridamole');
INSERT INTO medicine_list (medicine_id, name) VALUES (86, 'Diruil');
INSERT INTO medicine_list (medicine_id, name) VALUES (87, 'Doxazosin ');
INSERT INTO medicine_list (medicine_id, name) VALUES (88, 'Dyazide');
INSERT INTO medicine_list (medicine_id, name) VALUES (89, 'DynaCirc');
INSERT INTO medicine_list (medicine_id, name) VALUES (90, 'Dyrenium');
INSERT INTO medicine_list (medicine_id, name) VALUES (91, 'Edecrin');
INSERT INTO medicine_list (medicine_id, name) VALUES (92, 'Enalapril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (93, 'Enalapril + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (94, 'Enoxaparin');
INSERT INTO medicine_list (medicine_id, name) VALUES (95, 'epoetin alfa');
INSERT INTO medicine_list (medicine_id, name) VALUES (96, 'epoetin beta-methoxy polyethylene glycol');
INSERT INTO medicine_list (medicine_id, name) VALUES (97, 'Epogen');
INSERT INTO medicine_list (medicine_id, name) VALUES (98, 'Eprosartan ');
INSERT INTO medicine_list (medicine_id, name) VALUES (99, 'Esidrix');
INSERT INTO medicine_list (medicine_id, name) VALUES (100, 'Estrostep Fe');
INSERT INTO medicine_list (medicine_id, name) VALUES (101, 'Ethacrynic acid ');
INSERT INTO medicine_list (medicine_id, name) VALUES (102, 'Exenatide');
INSERT INTO medicine_list (medicine_id, name) VALUES (103, 'ezetimibe');
INSERT INTO medicine_list (medicine_id, name) VALUES (104, 'ezetimibe + simvastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (105, 'Felodipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (106, 'Felodipine + enalapril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (107, 'fenofibrate');
INSERT INTO medicine_list (medicine_id, name) VALUES (108, 'Feraheme');
INSERT INTO medicine_list (medicine_id, name) VALUES (109, 'Fergon');
INSERT INTO medicine_list (medicine_id, name) VALUES (110, 'Ferralet');
INSERT INTO medicine_list (medicine_id, name) VALUES (111, 'Ferrlecit');
INSERT INTO medicine_list (medicine_id, name) VALUES (112, 'ferrous gluconate');
INSERT INTO medicine_list (medicine_id, name) VALUES (113, 'ferumoxytol');
INSERT INTO medicine_list (medicine_id, name) VALUES (114, 'fluvastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (115, 'Fortamet');
INSERT INTO medicine_list (medicine_id, name) VALUES (116, 'Fosinopril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (117, 'Fragmin');
INSERT INTO medicine_list (medicine_id, name) VALUES (118, 'Furosemide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (119, 'gemfibrozil');
INSERT INTO medicine_list (medicine_id, name) VALUES (120, 'Glimepiride');
INSERT INTO medicine_list (medicine_id, name) VALUES (121, 'Glipizide');
INSERT INTO medicine_list (medicine_id, name) VALUES (122, 'Glucophage');
INSERT INTO medicine_list (medicine_id, name) VALUES (123, 'Glucotrol');
INSERT INTO medicine_list (medicine_id, name) VALUES (124, 'Glyburide');
INSERT INTO medicine_list (medicine_id, name) VALUES (125, 'Glynase');
INSERT INTO medicine_list (medicine_id, name) VALUES (126, 'Glyset');
INSERT INTO medicine_list (medicine_id, name) VALUES (127, 'Guanabenz ');
INSERT INTO medicine_list (medicine_id, name) VALUES (128, 'Guanfacine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (129, 'heme iron polypeptide/folic acid');
INSERT INTO medicine_list (medicine_id, name) VALUES (130, 'Heparin');
INSERT INTO medicine_list (medicine_id, name) VALUES (131, 'Hydralazine');
INSERT INTO medicine_list (medicine_id, name) VALUES (132, 'Hydralazine + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (133, 'Hydralazine hydrochloride ');
INSERT INTO medicine_list (medicine_id, name) VALUES (134, 'Hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (135, 'HydroDiuril');
INSERT INTO medicine_list (medicine_id, name) VALUES (136, 'Hytrin');
INSERT INTO medicine_list (medicine_id, name) VALUES (137, 'Hyzaar');
INSERT INTO medicine_list (medicine_id, name) VALUES (138, 'Imferon');
INSERT INTO medicine_list (medicine_id, name) VALUES (139, 'Indapamide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (140, 'Inderal');
INSERT INTO medicine_list (medicine_id, name) VALUES (141, 'Inderal LA');
INSERT INTO medicine_list (medicine_id, name) VALUES (142, 'Inderide');
INSERT INTO medicine_list (medicine_id, name) VALUES (143, 'INFeD');
INSERT INTO medicine_list (medicine_id, name) VALUES (144, 'Innohep');
INSERT INTO medicine_list (medicine_id, name) VALUES (145, 'Irbesartan ');
INSERT INTO medicine_list (medicine_id, name) VALUES (146, 'iron dextran');
INSERT INTO medicine_list (medicine_id, name) VALUES (147, 'Isoptin');
INSERT INTO medicine_list (medicine_id, name) VALUES (148, 'Isordil');
INSERT INTO medicine_list (medicine_id, name) VALUES (149, 'Isosorbide dinitrate');
INSERT INTO medicine_list (medicine_id, name) VALUES (150, 'Isradipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (151, 'Januvia');
INSERT INTO medicine_list (medicine_id, name) VALUES (152, 'Kerlone');
INSERT INTO medicine_list (medicine_id, name) VALUES (153, 'Labetalol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (154, 'Lanoxin');
INSERT INTO medicine_list (medicine_id, name) VALUES (155, 'Lanozicaps ');
INSERT INTO medicine_list (medicine_id, name) VALUES (156, 'Lasix');
INSERT INTO medicine_list (medicine_id, name) VALUES (157, 'Lescol');
INSERT INTO medicine_list (medicine_id, name) VALUES (158, 'Levatol');
INSERT INTO medicine_list (medicine_id, name) VALUES (159, 'Lexxel');
INSERT INTO medicine_list (medicine_id, name) VALUES (160, 'Linagliptin');
INSERT INTO medicine_list (medicine_id, name) VALUES (161, 'Lipitor');
INSERT INTO medicine_list (medicine_id, name) VALUES (162, 'Liraglutide');
INSERT INTO medicine_list (medicine_id, name) VALUES (163, 'Lisinopril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (164, 'Lisinopril + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (165, 'Livalo');
INSERT INTO medicine_list (medicine_id, name) VALUES (166, 'Loestrin Fe');
INSERT INTO medicine_list (medicine_id, name) VALUES (167, 'Lopid');
INSERT INTO medicine_list (medicine_id, name) VALUES (168, 'Lopressor');
INSERT INTO medicine_list (medicine_id, name) VALUES (169, 'Lopressor HCT');
INSERT INTO medicine_list (medicine_id, name) VALUES (170, 'Losartan ');
INSERT INTO medicine_list (medicine_id, name) VALUES (171, 'Losartan + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (172, 'Lotensin');
INSERT INTO medicine_list (medicine_id, name) VALUES (173, 'Lotensin HCT');
INSERT INTO medicine_list (medicine_id, name) VALUES (174, 'Lotrel');
INSERT INTO medicine_list (medicine_id, name) VALUES (175, 'lovastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (176, 'Lovenox');
INSERT INTO medicine_list (medicine_id, name) VALUES (177, 'Lozol');
INSERT INTO medicine_list (medicine_id, name) VALUES (178, 'Mavik');
INSERT INTO medicine_list (medicine_id, name) VALUES (179, 'Maxide');
INSERT INTO medicine_list (medicine_id, name) VALUES (180, 'Metformin');
INSERT INTO medicine_list (medicine_id, name) VALUES (181, 'Methyldopa ');
INSERT INTO medicine_list (medicine_id, name) VALUES (182, 'Methyldopa + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (183, 'Metolazone ');
INSERT INTO medicine_list (medicine_id, name) VALUES (184, 'Metoprolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (185, 'Metoprolol + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (186, 'Mevacor');
INSERT INTO medicine_list (medicine_id, name) VALUES (187, 'Micardis');
INSERT INTO medicine_list (medicine_id, name) VALUES (188, 'Microzide');
INSERT INTO medicine_list (medicine_id, name) VALUES (189, 'Midamor');
INSERT INTO medicine_list (medicine_id, name) VALUES (190, 'Miglitol');
INSERT INTO medicine_list (medicine_id, name) VALUES (191, 'Minipress');
INSERT INTO medicine_list (medicine_id, name) VALUES (192, 'Mircera');
INSERT INTO medicine_list (medicine_id, name) VALUES (193, 'Moduretic');
INSERT INTO medicine_list (medicine_id, name) VALUES (194, 'Moexipril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (195, 'Monopril');
INSERT INTO medicine_list (medicine_id, name) VALUES (196, 'Mykrox');
INSERT INTO medicine_list (medicine_id, name) VALUES (197, 'Nadolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (198, 'Nadolol + bendroflumethiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (199, 'Nateglinide');
INSERT INTO medicine_list (medicine_id, name) VALUES (200, 'Natrecor');
INSERT INTO medicine_list (medicine_id, name) VALUES (201, 'Nesiritide');
INSERT INTO medicine_list (medicine_id, name) VALUES (202, 'Niaspan');
INSERT INTO medicine_list (medicine_id, name) VALUES (203, 'Nicardipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (204, 'nicotinic acid');
INSERT INTO medicine_list (medicine_id, name) VALUES (205, 'Nifedipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (206, 'Nimodipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (207, 'Nimotop');
INSERT INTO medicine_list (medicine_id, name) VALUES (208, 'Nisoldipine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (209, 'Nitrates');
INSERT INTO medicine_list (medicine_id, name) VALUES (210, 'Nitroglycerin');
INSERT INTO medicine_list (medicine_id, name) VALUES (211, 'Norethindrone Ethinyl Estradiol Ferrous Fumarate/sulfate');
INSERT INTO medicine_list (medicine_id, name) VALUES (212, 'Normodyne');
INSERT INTO medicine_list (medicine_id, name) VALUES (213, 'Norvasc');
INSERT INTO medicine_list (medicine_id, name) VALUES (214, 'Omontys');
INSERT INTO medicine_list (medicine_id, name) VALUES (215, 'Onglyza');
INSERT INTO medicine_list (medicine_id, name) VALUES (216, 'Orgaran');
INSERT INTO medicine_list (medicine_id, name) VALUES (217, 'peginesatide');
INSERT INTO medicine_list (medicine_id, name) VALUES (218, 'Penbutolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (219, 'Perindopril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (220, 'Persantine');
INSERT INTO medicine_list (medicine_id, name) VALUES (221, 'Pioglitazone');
INSERT INTO medicine_list (medicine_id, name) VALUES (222, 'pitavastatin ');
INSERT INTO medicine_list (medicine_id, name) VALUES (223, 'Plavix');
INSERT INTO medicine_list (medicine_id, name) VALUES (224, 'Plendil');
INSERT INTO medicine_list (medicine_id, name) VALUES (225, 'Pramlintide');
INSERT INTO medicine_list (medicine_id, name) VALUES (226, 'Prandin');
INSERT INTO medicine_list (medicine_id, name) VALUES (227, 'Pravachol');
INSERT INTO medicine_list (medicine_id, name) VALUES (228, 'pravastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (229, 'Prazosin ');
INSERT INTO medicine_list (medicine_id, name) VALUES (230, 'Precose');
INSERT INTO medicine_list (medicine_id, name) VALUES (231, 'Prinivil');
INSERT INTO medicine_list (medicine_id, name) VALUES (232, 'Prinzide');
INSERT INTO medicine_list (medicine_id, name) VALUES (233, 'Procardia XL');
INSERT INTO medicine_list (medicine_id, name) VALUES (234, 'Procrit');
INSERT INTO medicine_list (medicine_id, name) VALUES (235, 'Proferrin');
INSERT INTO medicine_list (medicine_id, name) VALUES (236, 'Proferrin-Forte');
INSERT INTO medicine_list (medicine_id, name) VALUES (237, 'Propranolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (238, 'Propranolol + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (239, 'Questran');
INSERT INTO medicine_list (medicine_id, name) VALUES (240, 'Quinapril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (241, 'Ramipril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (242, 'Renagel ');
INSERT INTO medicine_list (medicine_id, name) VALUES (243, 'Renvela');
INSERT INTO medicine_list (medicine_id, name) VALUES (244, 'Repaglinide');
INSERT INTO medicine_list (medicine_id, name) VALUES (245, 'Reserpine ');
INSERT INTO medicine_list (medicine_id, name) VALUES (246, 'Rocaltrol');
INSERT INTO medicine_list (medicine_id, name) VALUES (247, 'Rosiglitazone');
INSERT INTO medicine_list (medicine_id, name) VALUES (248, 'rosuvastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (249, 'Saxagliptin');
INSERT INTO medicine_list (medicine_id, name) VALUES (250, 'Sectral');
INSERT INTO medicine_list (medicine_id, name) VALUES (251, 'Serpasil');
INSERT INTO medicine_list (medicine_id, name) VALUES (252, 'Sevelamer');
INSERT INTO medicine_list (medicine_id, name) VALUES (253, 'Simron');
INSERT INTO medicine_list (medicine_id, name) VALUES (254, 'simvastatin');
INSERT INTO medicine_list (medicine_id, name) VALUES (255, 'Sitagliptin');
INSERT INTO medicine_list (medicine_id, name) VALUES (256, 'sodium ferric gluconate complex');
INSERT INTO medicine_list (medicine_id, name) VALUES (257, 'Sotalol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (258, 'Spironolactone ');
INSERT INTO medicine_list (medicine_id, name) VALUES (259, 'Spironolactone + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (260, 'Starlix');
INSERT INTO medicine_list (medicine_id, name) VALUES (261, 'Sular');
INSERT INTO medicine_list (medicine_id, name) VALUES (262, 'Symlin');
INSERT INTO medicine_list (medicine_id, name) VALUES (263, 'Tarka');
INSERT INTO medicine_list (medicine_id, name) VALUES (264, 'Telmisartan ');
INSERT INTO medicine_list (medicine_id, name) VALUES (265, 'Tenex');
INSERT INTO medicine_list (medicine_id, name) VALUES (266, 'Tenoretic');
INSERT INTO medicine_list (medicine_id, name) VALUES (267, 'Tenormin');
INSERT INTO medicine_list (medicine_id, name) VALUES (268, 'Terazosin ');
INSERT INTO medicine_list (medicine_id, name) VALUES (269, 'Teveten');
INSERT INTO medicine_list (medicine_id, name) VALUES (270, 'Thalidone');
INSERT INTO medicine_list (medicine_id, name) VALUES (271, 'Tiazac');
INSERT INTO medicine_list (medicine_id, name) VALUES (272, 'Ticlid');
INSERT INTO medicine_list (medicine_id, name) VALUES (273, 'Ticlopidine');
INSERT INTO medicine_list (medicine_id, name) VALUES (274, 'Timolol ');
INSERT INTO medicine_list (medicine_id, name) VALUES (275, 'Tinzaparin');
INSERT INTO medicine_list (medicine_id, name) VALUES (276, 'Toprol');
INSERT INTO medicine_list (medicine_id, name) VALUES (277, 'Torsemide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (278, 'Tradjenta');
INSERT INTO medicine_list (medicine_id, name) VALUES (279, 'Trandate');
INSERT INTO medicine_list (medicine_id, name) VALUES (280, 'Trandolapril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (281, 'Triamterene ');
INSERT INTO medicine_list (medicine_id, name) VALUES (282, 'Triamterene + hydrochlorothiazide ');
INSERT INTO medicine_list (medicine_id, name) VALUES (283, 'Univasc');
INSERT INTO medicine_list (medicine_id, name) VALUES (284, 'Valsartan ');
INSERT INTO medicine_list (medicine_id, name) VALUES (285, 'Vascor');
INSERT INTO medicine_list (medicine_id, name) VALUES (286, 'Vaseretic');
INSERT INTO medicine_list (medicine_id, name) VALUES (287, 'Vasotec');
INSERT INTO medicine_list (medicine_id, name) VALUES (288, 'Verapamil extended release + trandolapril ');
INSERT INTO medicine_list (medicine_id, name) VALUES (289, 'Verapamil hydrochloride ');
INSERT INTO medicine_list (medicine_id, name) VALUES (290, 'Verelan');
INSERT INTO medicine_list (medicine_id, name) VALUES (291, 'Victoza');
INSERT INTO medicine_list (medicine_id, name) VALUES (292, 'Vytorin');
INSERT INTO medicine_list (medicine_id, name) VALUES (293, 'Warfarin');
INSERT INTO medicine_list (medicine_id, name) VALUES (294, 'Welchol');
INSERT INTO medicine_list (medicine_id, name) VALUES (295, 'Wytensin');
INSERT INTO medicine_list (medicine_id, name) VALUES (296, 'Zaroxolyn');
INSERT INTO medicine_list (medicine_id, name) VALUES (297, 'Zebeta');
INSERT INTO medicine_list (medicine_id, name) VALUES (298, 'Zestoretic');
INSERT INTO medicine_list (medicine_id, name) VALUES (299, 'Zestril');
INSERT INTO medicine_list (medicine_id, name) VALUES (300, 'Zetia');
INSERT INTO medicine_list (medicine_id, name) VALUES (301, 'Ziac');
INSERT INTO medicine_list (medicine_id, name) VALUES (302, 'Zocor');

DROP TABLE IF EXISTS adaptdb.cereal_list;
CREATE TABLE adaptdb.cereal_list (
  cereal_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(300) DEFAULT NULL,
  PRIMARY KEY (cereal_id)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=latin1;
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (1, '100% Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (2, '100% Low Fat Natural Granola');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (3, '100% Natural Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (4, '100% Natural Cereal, with oats, honey and raisins');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (5, '100% Natural Granola, Oats & Honey');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (6, '100% Natural Wholegrain Cereal with raisins, lowfat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (7, 'All-Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (8, 'All-Bran Bran Buds');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (9, 'All-Bran with Extra Fiber');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (10, 'Alpen');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (11, 'Alpha-Bits');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (12, 'Alpha-Bits with marshmallows');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (13, 'Amaranth Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (14, 'Apple Jacks');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (15, 'Apple Zaps');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (16, 'Apple Zings, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (17, 'Banana Nut Crunch Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (18, 'Barley');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (19, 'Basic 4');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (20, 'Berry Colossal Crunch, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (21, 'Blueberry Morning');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (22, 'Booberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (23, 'Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (24, 'Bran Buds');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (25, 'Bran flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (26, 'Bran, Nabisco');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (27, 'Branola');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (28, 'Brown Sugar Bliss');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (29, 'Buckwheat groats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (30, 'Bulgur');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (31, 'Cap''n Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (32, 'Cap''n Crunch''s Christmas Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (33, 'Cap''n Crunch''s Crunch Berries');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (34, 'Cap''n Crunch''s Oops! ChocoDonuts');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (35, 'Cap''n Crunch''s Peanut Butter Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (36, 'Cheerios');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (37, 'Cheerios, Apple Cinnamon');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (38, 'Cheerios, Berry Burst');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (39, 'Cheerios, Berry Burst Strawberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (40, 'Cheerios, Berry Burst Triple Berry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (41, 'Cheerios, Berry Burst, Cherry Vanilla');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (42, 'Cheerios, Berry Burst, Strawberry Banana');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (43, 'Cheerios, Frosted');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (44, 'Cheerios, Honey Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (45, 'Cheerios, Multi Grain');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (46, 'Cheerios, Team');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (47, 'Cheerios, Yogurt Burst, Strawberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (48, 'Cheerios, Yogurt Burst, Vanilla');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (49, 'Cheese grits');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (50, 'Chex');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (51, 'Chex Morning Mix Banana Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (52, 'Chex Morning Mix Cinnamon');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (53, 'Chex Morning Mix Fruit & Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (54, 'Chex Morning Mix Honey Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (55, 'Chex, Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (56, 'Chex, Corn');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (57, 'Chex, Honey Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (58, 'Chex, Multi-Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (59, 'Chex, Rice');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (60, 'Chex, Wheat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (61, 'Chocolate frosted cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (62, 'Cinnamon Cluster Raisin Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (63, 'Cinnamon Crunch Crispix');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (64, 'Cinnamon Grahams Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (65, 'Cinnamon Marshmallow Scooby Doo!');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (66, 'Cinnamon Toast Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (67, 'Cinnamon Toast Crunch, Reduced Sugar');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (68, 'Coco-Roos, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (69, 'Cocoa Blasts');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (70, 'Cocoa Comets');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (71, 'Cocoa Dyno Bites, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (72, 'Cocoa Krispies');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (73, 'Cocoa Pebbles');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (74, 'Cocoa Puffs');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (75, 'Cocoa Puffs, Reduced Sugar');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (76, 'Cocoa Wheats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (77, 'Complete Bran Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (78, 'Complete Oat Bran Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (79, 'Complete Wheat Bran Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (80, 'Cookie-Crisp (all flavors)');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (81, 'Corn Bursts, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (82, 'Corn Flakes, Kellogg''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (83, 'Corn Pops');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (84, 'Corn Puffs');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (85, 'Corn flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (86, 'Corn flakes, low sodium');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (87, 'Cornmeal mush');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (88, 'Count Chocula');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (89, 'Cracklin'' Oat Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (90, 'Cranberry Almond Crunch Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (91, 'Cream of Rice');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (92, 'Cream of Rye');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (93, 'Cream of Wheat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (94, 'Crisp Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (95, 'Crispix');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (96, 'Crispy Brown Rice Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (97, 'Crispy Rice');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (98, 'Crispy Rice, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (99, 'Crispy Wheats''N Raisins');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (100, 'Crunchy Corn Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (101, 'Disney Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (102, 'Disney Hunny B''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (103, 'Disney Mickey''s Magix');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (104, 'Disney Mud & Bugs');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (105, 'Ener-G Pure Rice Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (106, 'Familia');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (107, 'Farina');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (108, 'Fiber 7 Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (109, 'Fiber One');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (110, 'Frankenberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (111, 'French Toast Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (112, 'Froot Loops');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (113, 'Frosted Flakes, Kellogg''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (114, 'Frosted Flakes, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (115, 'Frosted Fruit Rings');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (116, 'Frosted Mini Spooners, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (117, 'Frosted Mini Wheats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (118, 'Frosted Shredded Wheat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (119, 'Frosted Wheat Bites');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (120, 'Frosted cereal, with marshmallows');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (121, 'Frosted corn flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (122, 'Frosted flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (123, 'Frosted rice');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (124, 'Frosty O''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (125, 'Fruit & Fibre (fiber)');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (126, 'Fruit & Fibre (fiber) with Dates, Raisins and Walnuts');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (127, 'Fruit & Fibre (fiber) with Peaches, Raisins, Almonds, and Oat Clusters');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (128, 'Fruit Harvest');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (129, 'Fruit Harvest Apple Cinnamon');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (130, 'Fruit Harvest Strawberry Blueberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (131, 'Fruit Loops');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (132, 'Fruit Rings');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (133, 'Fruit Whirls');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (134, 'Fruit and Cream Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (135, 'Fruity Dyno Bites, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (136, 'Fruity Pebbles');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (137, 'Golden Crisp');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (138, 'Golden Grahams');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (139, 'Golden Puffs, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (140, 'Granola');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (141, 'Granola, homemade');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (142, 'Granola, lowfat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (143, 'Granola, lowfat, Kellogg''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (144, 'Granola, lowfat, with Raisins, Kellogg''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (145, 'Grape Nut O''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (146, 'Grape-Nuts');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (147, 'Grape-Nuts Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (148, 'Great Grains Crunchy Pecan Whole Grain Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (149, 'Great Grains, Raisins, Dates, and Pecans Whole Grain Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (150, 'Grits');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (151, 'Harina de maize con leche');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (152, 'Harmony Vanilla Almond Oats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (153, 'Healthy Choice');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (154, 'Honey Bunches of Oat Honey Roasted');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (155, 'Honey Bunches of Oat with Strawberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (156, 'Honey Bunches of Oats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (157, 'Honey Bunches of Oats with Almonds');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (158, 'Honey Buzzers, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (159, 'Honey Crisp Corn Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (160, 'Honey Crunch Corn Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (161, 'Honey Graham Squares, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (162, 'Honey Nut Clusters');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (163, 'Honey Nut Heaven');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (164, 'Honey Nut Shredded Wheat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (165, 'Honey Smacks');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (166, 'Honeycomb');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (167, 'Honeycomb, strawberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (168, 'Instant Grits, all flavors');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (169, 'Jenny O''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (170, 'Just Right');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (171, 'Just Right with Fruit & Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (172, 'Kaboom');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (173, 'Kasha');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (174, 'Kashi');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (175, 'Kashi GOLEAN');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (176, 'Kashi Good Friends');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (177, 'Kashi Good Friends Cinna-Raisin Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (178, 'Kashi Heart to Heart Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (179, 'Kashi Honey Puffed');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (180, 'Kashi Medley');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (181, 'Kashi Organic Promise');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (182, 'Kashi Pilaf');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (183, 'Kashi Pillows');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (184, 'Kashi Seven in the Morning');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (185, 'Kashi, Puffed');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (186, 'Kix');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (187, 'Kix, Berry Berry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (188, 'Life (plain and cinnamon)');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (189, 'Lucky Charms');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (190, 'Lucky Charms, Berry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (191, 'Lucky Charms, Chocolate');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (192, 'Magic Stars');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (193, 'Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (194, 'Malt-O-Meal, chocolate');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (195, 'Maltex');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (196, 'Marshmallow Mateys, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (197, 'Marshmallow Safari');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (198, 'Masa harina');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (199, 'Maypo');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (200, 'Millet');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (201, 'Millet, puffed');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (202, 'Mini-Wheats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (203, 'Mini-Wheats Frosted Bite Size');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (204, 'Mini-Wheats Frosted Original');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (205, 'Mini-Wheats Frosted Raisin');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (206, 'Mini-Wheats Frosted Strawberry');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (207, 'Mother''s Natural Foods Cereal, Quaker');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (208, 'Muesli');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (209, 'Muesli(x)');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (210, 'Multigrain Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (211, 'Multigrain cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (212, 'Natural Bran Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (213, 'Nature Valley Granola');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (214, 'Nature Valley Granola, with fruit and nuts');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (215, 'Nesquik');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (216, 'Nestum');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (217, 'Nu System Cuisine Toasted Grain Circles');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (218, 'Nutri-Grain');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (219, 'Nutri-Grain Golden Wheat and Raisin');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (220, 'Nutty Nuggets');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (221, 'Oat Bran Cereal, Quaker');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (222, 'Oat Bran Flakes, Health Valley');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (223, 'Oat bran cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (224, 'Oat bran uncooked');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (225, 'Oat cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (226, 'Oat flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (227, 'Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (228, 'Oatmeal Crisp');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (229, 'Oatmeal Crisp with Almonds');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (230, 'Oatmeal Crisp, Apple Cinnamon');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (231, 'Oatmeal Crisp, Raisin');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (232, 'Oatmeal Squares');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (233, 'Oatmeal Swirlers');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (234, 'Oats, raw');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (235, 'Oh''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (236, 'Oh''s, Apple Cinnamon');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (237, 'Oh''s, Fruitangy');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (238, 'Oh''s, Honey Graham');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (239, 'Old Wessex Irish Style Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (240, 'Optimum Slim, Nature''s Path');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (241, 'Optimum, Nature''s Path');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (242, 'Oreo O''s Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (243, 'Peanut Butter Toast Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (244, 'Polenta');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (245, 'Product 19');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (246, 'Puffed Rice, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (247, 'Puffed Wheat, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (248, 'Quaker Dinosaur Eggs oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (249, 'Quaker Fruit and Cream Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (250, 'Quaker Instant Grits, all flavors');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (251, 'Quaker Multigrain Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (252, 'Quaker Oatmeal Express');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (253, 'Quaker Oatmeal Nutrition for Women');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (254, 'Quaker Oatmeal Squares');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (255, 'Quisp');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (256, 'Raisin Bran Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (257, 'Raisin Bran, Kellogg''s');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (258, 'Raisin Bran, Post');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (259, 'Raisin Nut Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (260, 'Raisin bran (generic)');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (261, 'Reese''s Peanut Butter Puffs');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (262, 'Rice Krispies');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (263, 'Rice Krispies, Frosted');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (264, 'Rice Krispies, Treats Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (265, 'Rice bran, uncooked');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (266, 'Rice cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (267, 'Rice flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (268, 'Rice polishings');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (269, 'Rice, puffed');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (270, 'Roman Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (271, 'Seven-grain Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (272, 'Shredded Wheat');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (273, 'Shredded Wheat ''N Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (274, 'Shredded Wheat Spoon Size');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (275, 'Shredded Wheat, 100%');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (276, 'Shredded Wheat, Original');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (277, 'Smacks');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (278, 'Smart Start');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (279, 'Smorz');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (280, 'Special K');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (281, 'Special K Fruit & Yogurt');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (282, 'Special K Low Carb Lifestyle Protein Plus');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (283, 'Special K Red Berries');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (284, 'Special K Vanilla Almond');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (285, 'Strawberry Squares');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (286, 'Sun Country 100% Natural Granola, with Almonds');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (287, 'Sweet Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (288, 'Sweet Puffs');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (289, 'Tasteeos');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (290, 'Toasted Cinnamon Twists, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (291, 'Toasted Oatmeal Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (292, 'Toasted Oatmeal, Honey Nut');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (293, 'Toasted oat cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (294, 'Toasties');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (295, 'Toasty O''s, Apple Cinnamon, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (296, 'Toasty O''s, Honey and Nut, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (297, 'Toasty O''s, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (298, 'Tony''s Cinnamon Crunchers');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (299, 'Tootie Fruities, Malt-O-Meal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (300, 'Total');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (301, 'Total Brown Sugar & Oats');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (302, 'Total Corn Flakes');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (303, 'Total Instant Oatmeal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (304, 'Total Raisin Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (305, 'Trix');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (306, 'Trix, Reduced Sugar');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (307, 'Uncle Sam''s Hi Fiber Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (308, 'Under Cover Bears');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (309, 'Waffle Crisp');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (310, 'Weetabix Whole Wheat Cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (311, 'Wheat Hearts');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (312, 'Wheat bran, unprocessed (miller''s bran)');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (313, 'Wheat cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (314, 'Wheat germ');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (315, 'Wheat germ, with sugar and honey');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (316, 'Wheat, puffed');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (317, 'Wheat, puffed, presweetened with sugar');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (318, 'Wheatena');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (319, 'Wheaties');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (320, 'Wheaties Energy Crunch');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (321, 'Wheaties Raisin Bran');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (322, 'Whole wheat cereal');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (323, 'Whole wheat, cracked');
INSERT INTO adaptdb.cereal_list (cereal_id, name) VALUES (324, 'Zoom');

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS adaptdb.questionnaire ;
DROP TABLE IF EXISTS adaptdb.questionnaire_sequence;

DROP TABLE IF EXISTS adaptdb.rows;
DROP TABLE IF EXISTS adaptdb.choices;
DROP TABLE IF EXISTS adaptdb.columns;
DROP TABLE IF EXISTS adaptdb.elements;
DROP TABLE IF EXISTS adaptdb.pages;
DROP TABLE IF EXISTS adaptdb.questionnaires;
DROP TABLE IF EXISTS adaptdb.questionnaire_triggers;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE adaptdb.questionnaires (
    questionnaires_id int(11) NOT NULL AUTO_INCREMENT,
    show_progress_bar varchar(45) DEFAULT NULL,
    show_page_titles tinyint(4) DEFAULT NULL,
    show_question_numbers varchar(45) DEFAULT NULL,
    completed_html blob,
    title varchar(500) DEFAULT NULL,
    show_preview_before_complete varchar(255) DEFAULT NULL,
    check_errors_mode varchar(255) DEFAULT NULL,
    study_id INT NOT NULL,
    PRIMARY KEY (questionnaires_id),
    KEY study_idx1 (study_id),
    CONSTRAINT questionnaires_fk1 FOREIGN KEY (study_id) REFERENCES study (study_id)
    ) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE adaptdb.pages (
    page_id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    title varchar(255) DEFAULT NULL,
    questionnaires_id int(11) NOT NULL,
    PRIMARY KEY (name, questionnaires_id),
    KEY questionnaires_id_idx (questionnaires_id),
    KEY page_id (page_id),
    CONSTRAINT questionnaires_id FOREIGN KEY (questionnaires_id) REFERENCES questionnaires (questionnaires_id)
    ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE adaptdb.elements (
    elements_id int(11) NOT NULL AUTO_INCREMENT,
    start_with_new_line tinyint(4) DEFAULT '1',
    has_other tinyint(4) DEFAULT NULL,
    name varchar(255) NOT NULL,
    visible_if varchar(255) DEFAULT NULL,
    type varchar(255) NOT NULL,
    title varchar(500) DEFAULT NULL,
    title_location varchar(45) DEFAULT NULL,
    col_count int(11) DEFAULT NULL,
    description longtext,
    input_type varchar(255) DEFAULT NULL,
    other_text varchar(255) DEFAULT NULL,
    popupdescription blob,
    page_id int(11) NOT NULL,
    questionnaires_id int(11) NOT NULL,
    choices_by_url varchar(255) DEFAULT NULL,
    is_required tinyint(4) DEFAULT '0',
    enable_if varchar(255) DEFAULT NULL,
    render_as varchar(255) DEFAULT NULL,
    is_all_row_required tinyint(4) DEFAULT '0',
    default_value varchar(255) DEFAULT NULL,
    min int(11) DEFAULT NULL,
    max int(11) DEFAULT NULL,
    required_if varchar(255) DEFAULT NULL,
    indent int(11) DEFAULT '0',
    image_link VARCHAR(255),
    image_height INT,
    image_width INT,
    html blob,
    PRIMARY KEY (name, questionnaires_id),
    KEY elements_id (elements_id),
    KEY page_id_idx (elements_id, page_id),
    KEY page_id_idx1 (page_id),
    KEY questionnaires_id_idx (questionnaires_id),
    CONSTRAINT elements_fk2 FOREIGN KEY (questionnaires_id) REFERENCES questionnaires (questionnaires_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT page_id_fk FOREIGN KEY (page_id) REFERENCES pages (page_id) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

CREATE TABLE adaptdb.choices (
    chioce_id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    value varchar(255) DEFAULT NULL,
    elements_id int(11) NOT NULL,
    PRIMARY KEY (chioce_id),
    KEY elements_id_idx (elements_id),
    CONSTRAINT elements_id FOREIGN KEY (elements_id) REFERENCES elements (elements_id) ON DELETE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

CREATE TABLE adaptdb.columns (
    column_id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    value varchar(255) DEFAULT NULL,
    elements_id int(11) NOT NULL,
    PRIMARY KEY (column_id),
    KEY columns_elements_id_fk (elements_id),
    CONSTRAINT columns_elements_id_fk FOREIGN KEY (elements_id) REFERENCES elements (elements_id) ON DELETE NO ACTION
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE adaptdb.rows (
    row_id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    value varchar(255) DEFAULT NULL,
    elements_id int(11) NOT NULL,
    PRIMARY KEY (row_id),
    KEY rows_elements_id_fk (elements_id),
    CONSTRAINT rows_elements_id_fk FOREIGN KEY (elements_id) REFERENCES elements (elements_id) ON DELETE NO ACTION
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE adaptdb.questionnaire_triggers (
    questionnaire_trigger_id int(11) NOT NULL AUTO_INCREMENT,
    expression varchar(255) NOT NULL,
    set_to_name varchar(255) DEFAULT NULL,
    set_value varchar(255) DEFAULT NULL,
    type varchar(255) DEFAULT NULL,
    questionnaires_id int(11) NOT NULL,
    PRIMARY KEY (questionnaire_trigger_id),
    KEY questionnaires_id_idx (questionnaires_id),
    CONSTRAINT questionnaires_id_trigger FOREIGN KEY (questionnaires_id) REFERENCES questionnaires (questionnaires_id)
    ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO adaptdb.questionnaires (questionnaires_id, show_progress_bar, show_page_titles, show_question_numbers, completed_html, title, show_preview_before_complete, check_errors_mode, study_id) VALUES (13, 'top', 0, 'off', '<h2>Thank you for submitting the Questionnaire<h2>', 'Vascular Risk', 'showAllQuestions', 'onComplete', 1001);
INSERT INTO adaptdb.questionnaires (questionnaires_id, show_progress_bar, show_page_titles, show_question_numbers, completed_html, title, show_preview_before_complete, check_errors_mode, study_id) VALUES (14, 'top', 0, 'off', '<h2>Thank you for submitting the Questionnaire<h2>', 'Sleep', 'showAllQuestions', 'onComplete', 1002);
INSERT INTO adaptdb.questionnaires (questionnaires_id, show_progress_bar, show_page_titles, show_question_numbers, completed_html, title, show_preview_before_complete, check_errors_mode, study_id) VALUES (15, 'top', 0, 'off', '<h2>Thank you for submitting the Questionnaire<h2>', 'Everyday Cognition (E-Cog)', 'showAllQuestions', 'onComplete', 1003);
INSERT INTO adaptdb.questionnaires (questionnaires_id, show_progress_bar, show_page_titles, show_question_numbers, completed_html, title, show_preview_before_complete, check_errors_mode, study_id) VALUES (16, 'top', 0, 'off', '<h2>Thank you for submitting the Questionnaire<h2>', 'Diet screener questionnaire', 'showAllQuestions', 'onComplete', 1004);
INSERT INTO adaptdb.questionnaires (questionnaires_id, show_progress_bar, show_page_titles, show_question_numbers, completed_html, title, show_preview_before_complete, check_errors_mode, study_id) VALUES (17, null, 0, 'off', '<h2>Thank you for submitting the Questionnaire<h2>', 'Physical Activity Screening', 'showAllQuestions', 'onComplete', 1005);

INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (105, 'Participant', 'patient', 79);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (106, 'Informant/Family Member', 'relative', 79);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (107, 'Yes', 'yes', 82);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (108, 'No', 'no', 82);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (109, 'Unknown', 'unknown', 82);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (110, '0 to 5 Years', '0to5years', 83);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (111, '6 to 10 Years', '6to10years', 83);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (112, '11 to 20 Years', '11to20years', 83);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (113, '21 to 30 Years', '21to30years', 83);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (114, '30+ Years', '30plusyears', 83);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (115, 'Yes', 'yes', 84);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (116, 'No', 'no', 84);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (117, 'Unknown', 'unknown', 84);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (118, 'Yes', 'yes', 85);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (119, 'No', 'no', 85);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (120, 'Unknown', 'unknown', 85);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (121, 'Diet', 'diet', 87);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (122, 'Exercise', 'exercise', 87);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (123, 'Yes', 'yes', 88);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (124, 'No', 'no', 88);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (125, 'Unknown', 'unknown', 88);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (126, '0 to 5 Years', '0to5years', 89);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (127, '6 to 10 Years', '6to10years', 89);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (128, '11 to 20 Years', '11to20years', 89);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (129, '21 to 30 Years', '21to30years', 89);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (130, '30+ Years', '30plusyears', 89);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (131, 'Yes', 'yes', 90);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (132, 'No', 'no', 90);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (133, 'Unknown', 'unknown', 90);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (134, 'Yes', 'yes', 91);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (135, 'No', 'no', 91);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (136, 'Unknown', 'unknown', 91);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (137, 'Diet', 'diet', 93);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (138, 'Exercise', 'exercise', 93);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (139, 'Yes', 'yes', 94);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (140, 'No', 'no', 94);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (141, 'Unknown', 'unknown', 94);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (142, '0 to 5 Years', '0to5years', 95);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (143, '6 to 10 Years', '6to10years', 95);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (144, '11 to 20 Years', '11to20years', 95);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (145, '21 to 30 Years', '21to30years', 95);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (146, '30+ Years', '30plusyears', 95);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (147, 'Yes', 'yes', 96);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (148, 'No', 'no', 96);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (149, 'Unknown', 'unknown', 96);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (150, 'Yes', 'yes', 97);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (151, 'No', 'no', 97);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (152, 'Unknown', 'unknown', 97);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (153, 'Diet', 'diet', 99);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (154, 'Exercise', 'exercise', 99);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (155, 'Yes', 'yes', 100);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (156, 'No', 'no', 100);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (157, 'Unknown', 'unknown', 100);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (158, '0 to 5 Years', '0to5years', 101);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (159, '6 to 10 Years', '6to10years', 101);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (160, '11 to 20 Years', '11to20years', 101);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (161, '21 to 30 Years', '21to30years', 101);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (162, '30+ Years', '30plusyears', 101);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (163, 'Yes', 'yes', 102);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (164, 'No', 'no', 102);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (165, 'Unknown', 'unknown', 102);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (166, 'Yes', 'yes', 103);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (167, 'No', 'no', 103);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (168, 'Unknown', 'unknown', 103);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (169, 'Diet', 'diet', 105);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (170, 'Exercise', 'exercise', 105);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (171, 'Yes', 'yes', 106);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (172, 'No', 'no', 106);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (173, 'Unknown', 'unknown', 106);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (174, '0 to 5 Years', '0to5years', 107);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (175, '6 to 10 Years', '6to10years', 107);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (176, '11 to 20 Years', '11to20years', 107);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (177, '21 to 30 Years', '21to30years', 107);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (178, '30+ Years', '30plusyears', 107);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (179, 'Yes', 'yes', 108);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (180, 'No', 'no', 108);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (181, 'Unknown', 'unknown', 108);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (182, 'Yes', 'yes', 109);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (183, 'No', 'no', 109);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (184, 'Unknown', 'unknown', 109);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (185, 'Diet', 'diet', 111);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (186, 'Exercise', 'exercise', 111);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (187, 'Yes', 'yes', 112);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (188, 'No', 'no', 112);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (189, 'Unknown', 'unknown', 112);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (190, '0 to 5 Years', '0to5years', 113);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (191, '6 to 10 Years', '6to10years', 113);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (192, '11 to 20 Years', '11to20years', 113);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (193, '21 to 30 Years', '21to30years', 113);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (194, '30+ Years', '30plusyears', 113);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (195, 'Yes', 'yes', 114);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (196, 'No', 'no', 114);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (197, 'Unknown', 'unknown', 114);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (198, 'Yes', 'yes', 115);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (199, 'No', 'no', 115);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (200, 'Unknown', 'unknown', 115);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (201, 'Diet', 'diet', 117);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (202, 'Exercise', 'exercise', 117);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (203, 'Male', 'male', 121);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (204, 'Female', 'female', 121);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (205, 'Yes', 'yes', 122);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (206, 'No', 'no', 122);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (207, 'Don''t know', 'dontknow', 122);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (208, 'Slightly louder than breathing', 'a', 123);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (209, 'As loud as talking', 'b', 123);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (210, 'Louder than talking', 'c', 123);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (211, 'Very loud can be heard in adjacent rooms', 'd', 123);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (212, 'Don''t know', 'dontknow', 123);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (213, 'Nearly every day', 'a', 124);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (214, '3-4 times a week', 'b', 124);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (215, '1-2 times a week', 'c', 124);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (216, '1-2 times a month', 'd', 124);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (217, 'Never or nearly never', 'e', 124);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (218, 'Don''t know', 'dontknow', 124);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (219, 'Yes', 'yes', 125);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (220, 'No', 'no', 125);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (221, 'Don''t know', 'dontknow', 125);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (222, 'Nearly every day', 'a', 126);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (223, '3-4 times a week', 'b', 126);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (224, '1-2 times a week', 'c', 126);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (225, '1-2 times a month', 'd', 126);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (226, 'Never or nearly never', 'e', 126);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (227, 'Don''t know', 'dontknow', 126);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (228, 'Nearly every day', 'a', 127);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (229, '3-4 times a week', 'b', 127);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (230, '1-2 times a week', 'c', 127);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (231, '1-2 times a month', 'd', 127);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (232, 'Never or nearly never', 'e', 127);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (233, 'Don''t know', 'dontknow', 127);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (234, 'Nearly every day', 'a', 128);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (235, '3-4 times a week', 'b', 128);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (236, '1-2 times a week', 'c', 128);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (237, '1-2 times a month', 'd', 128);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (238, 'Never or nearly never', 'e', 128);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (239, 'Don''t know', 'dontknow', 128);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (240, 'Yes', 'yes', 129);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (241, 'No', 'no', 129);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (242, 'Don''t know', 'dontknow', 129);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (243, 'Nearly every day', 'a', 130);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (244, '3-4 times a week', 'b', 130);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (245, '1-2 times a week', 'c', 130);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (246, '1-2 times a month', 'd', 130);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (247, 'Never or nearly never', 'e', 130);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (248, 'Don''t know', 'dontknow', 130);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (249, 'Yes', 'yes', 131);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (250, 'No', 'no', 131);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (251, 'Don''t know', 'dontknow', 131);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (252, 'Male', 'male', 139);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (253, 'Female', 'female', 139);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (254, 'Yes', 'yes', 140);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (255, 'No', 'no', 140);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (256, 'Don''t know', 'dontknow', 140);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (257, 'Per day', 'perday', 141);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (258, 'Per week', 'perweek', 141);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (259, 'Per month', 'permonth', 141);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (260, 'Don''t know', 'dontknow', 141);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (261, 'Hot Cereal', 'hotcereal', 142);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (262, 'Cold Cereal', 'coldcereal', 142);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (263, 'Yes', 'yes', 145);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (264, 'No', 'no', 145);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (265, 'Don''t know', 'dontknow', 145);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (266, 'Hot Cereal', 'hotcereal', 146);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (267, 'Cold Cereal', 'coldcereal', 146);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (268, 'Yes', 'yes', 149);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (269, 'No', 'no', 149);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (270, 'Don''t know', 'dontknow', 149);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (271, 'Per day', 'perday', 150);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (272, 'Per week', 'perweek', 150);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (273, 'Per month', 'permonth', 150);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (274, 'Don''t know', 'dontknow', 150);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (275, 'Whole or regular milk', 'item1', 151);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (276, '2% fat or reduced-fat milk', 'item2', 151);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (277, '1%, 1/2%, or low-fat milk', 'item3', 151);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (278, 'Fat-free, skim or non-fat milk', 'item4', 151);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (279, 'Soy milk', 'item5', 151);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (280, 'Don''t know', 'dontknow', 151);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (281, 'Yes', 'yes', 152);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (282, 'No', 'no', 152);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (283, 'Don''t know', 'dontknow', 152);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (284, 'Per day', 'perday', 153);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (285, 'Per week', 'perweek', 153);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (286, 'Per month', 'permonth', 153);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (287, 'Don''t know', 'dontknow', 153);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (288, 'Yes', 'yes', 154);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (289, 'No', 'no', 154);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (290, 'Don''t know', 'dontknow', 154);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (291, 'Per day', 'perday', 155);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (292, 'Per week', 'perweek', 155);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (293, 'Per month', 'permonth', 155);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (294, 'Don''t know', 'dontknow', 155);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (295, 'Yes', 'yes', 156);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (296, 'No', 'no', 156);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (297, 'Don''t know', 'dontknow', 156);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (298, 'Per day', 'perday', 157);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (299, 'Per week', 'perweek', 157);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (300, 'Per month', 'permonth', 157);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (301, 'Don''t know', 'dontknow', 157);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (302, 'Yes', 'yes', 158);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (303, 'No', 'no', 158);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (304, 'Don''t know', 'dontknow', 158);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (305, 'Per day', 'perday', 159);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (306, 'Per week', 'perweek', 159);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (307, 'Per month', 'permonth', 159);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (308, 'Don''t know', 'dontknow', 159);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (309, 'Yes', 'yes', 160);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (310, 'No', 'no', 160);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (311, 'Don''t know', 'dontknow', 160);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (312, 'Per day', 'perday', 161);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (313, 'Per week', 'perweek', 161);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (314, 'Per month', 'permonth', 161);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (315, 'Don''t know', 'dontknow', 161);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (316, 'Yes', 'yes', 162);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (317, 'No', 'no', 162);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (318, 'Don''t know', 'dontknow', 162);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (319, 'Per day', 'perday', 163);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (320, 'Per week', 'perweek', 163);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (321, 'Per month', 'permonth', 163);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (322, 'Don''t know', 'dontknow', 163);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (323, 'Yes', 'yes', 164);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (324, 'No', 'no', 164);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (325, 'Don''t know', 'dontknow', 164);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (326, 'Per day', 'perday', 165);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (327, 'Per week', 'perweek', 165);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (328, 'Per month', 'permonth', 165);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (329, 'Don''t know', 'dontknow', 165);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (330, 'Yes', 'yes', 166);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (331, 'No', 'no', 166);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (332, 'Don''t know', 'dontknow', 166);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (333, 'Per day', 'perday', 167);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (334, 'Per week', 'perweek', 167);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (335, 'Per month', 'permonth', 167);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (336, 'Don''t know', 'dontknow', 167);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (337, 'Yes', 'yes', 168);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (338, 'No', 'no', 168);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (339, 'Don''t know', 'dontknow', 168);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (340, 'Per day', 'perday', 169);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (341, 'Per week', 'perweek', 169);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (342, 'Per month', 'permonth', 169);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (343, 'Don''t know', 'dontknow', 169);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (344, 'Yes', 'yes', 170);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (345, 'No', 'no', 170);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (346, 'Don''t know', 'dontknow', 170);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (347, 'Per day', 'perday', 171);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (348, 'Per week', 'perweek', 171);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (349, 'Per month', 'permonth', 171);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (350, 'Don''t know', 'dontknow', 171);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (351, 'Yes', 'yes', 172);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (352, 'No', 'no', 172);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (353, 'Don''t know', 'dontknow', 172);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (354, 'Per day', 'perday', 173);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (355, 'Per week', 'perweek', 173);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (356, 'Per month', 'permonth', 173);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (357, 'Don''t know', 'dontknow', 173);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (358, 'Yes', 'yes', 174);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (359, 'No', 'no', 174);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (360, 'Don''t know', 'dontknow', 174);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (361, 'Per day', 'perday', 175);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (362, 'Per week', 'perweek', 175);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (363, 'Per month', 'permonth', 175);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (364, 'Don''t know', 'dontknow', 175);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (365, 'Yes', 'yes', 176);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (366, 'No', 'no', 176);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (367, 'Don''t know', 'dontknow', 176);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (368, 'Per day', 'perday', 177);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (369, 'Per week', 'perweek', 177);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (370, 'Per month', 'permonth', 177);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (371, 'Don''t know', 'dontknow', 177);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (372, 'Yes', 'yes', 178);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (373, 'No', 'no', 178);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (374, 'Don''t know', 'dontknow', 178);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (375, 'Per day', 'perday', 179);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (376, 'Per week', 'perweek', 179);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (377, 'Per month', 'permonth', 179);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (378, 'Don''t know', 'dontknow', 179);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (379, 'Yes', 'yes', 180);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (380, 'No', 'no', 180);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (381, 'Don''t know', 'dontknow', 180);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (382, 'Per day', 'perday', 181);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (383, 'Per week', 'perweek', 181);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (384, 'Per month', 'permonth', 181);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (385, 'Don''t know', 'dontknow', 181);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (386, 'Yes', 'yes', 182);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (387, 'No', 'no', 182);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (388, 'Don''t know', 'dontknow', 182);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (389, 'Per day', 'perday', 183);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (390, 'Per week', 'perweek', 183);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (391, 'Per month', 'permonth', 183);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (392, 'Don''t know', 'dontknow', 183);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (393, 'Yes', 'yes', 184);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (394, 'No', 'no', 184);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (395, 'Don''t know', 'dontknow', 184);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (396, 'Per day', 'perday', 185);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (397, 'Per week', 'perweek', 185);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (398, 'Per month', 'permonth', 185);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (399, 'Don''t know', 'dontknow', 185);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (400, 'Yes', 'yes', 186);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (401, 'No', 'no', 186);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (402, 'Don''t know', 'dontknow', 186);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (403, 'Per day', 'perday', 187);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (404, 'Per week', 'perweek', 187);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (405, 'Per month', 'permonth', 187);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (406, 'Don''t know', 'dontknow', 187);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (407, 'Yes', 'yes', 188);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (408, 'No', 'no', 188);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (409, 'Don''t know', 'dontknow', 188);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (410, 'Per day', 'perday', 189);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (411, 'Per week', 'perweek', 189);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (412, 'Per month', 'permonth', 189);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (413, 'Don''t know', 'dontknow', 189);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (414, 'Yes', 'yes', 190);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (415, 'No', 'no', 190);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (416, 'Don''t know', 'dontknow', 190);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (417, 'Per day', 'perday', 191);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (418, 'Per week', 'perweek', 191);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (419, 'Per month', 'permonth', 191);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (420, 'Don''t know', 'dontknow', 191);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (421, 'Yes', 'yes', 192);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (422, 'No', 'no', 192);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (423, 'Don''t know', 'dontknow', 192);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (424, 'Per day', 'perday', 193);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (425, 'Per week', 'perweek', 193);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (426, 'Per month', 'permonth', 193);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (427, 'Don''t know', 'dontknow', 193);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (428, 'Yes', 'yes', 194);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (429, 'No', 'no', 194);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (430, 'Don''t know', 'dontknow', 194);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (431, 'Per day', 'perday', 195);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (432, 'Per week', 'perweek', 195);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (433, 'Per month', 'permonth', 195);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (434, 'Don''t know', 'dontknow', 195);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (435, 'Yes', 'yes', 196);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (436, 'No', 'no', 196);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (437, 'Don''t know', 'dontknow', 196);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (438, 'Per day', 'perday', 197);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (439, 'Per week', 'perweek', 197);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (440, 'Per month', 'permonth', 197);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (441, 'Don''t know', 'dontknow', 197);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (442, 'Yes', 'yes', 200);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (443, 'No', 'no', 200);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (444, 'Don''t know', 'dontknow', 200);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (445, 'Yes', 'yes', 201);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (446, 'No', 'no', 201);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (447, 'Don''t know', 'dontknow', 201);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (448, 'Yes', 'yes', 202);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (449, 'No', 'no', 202);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (450, 'Don''t know', 'dontknow', 202);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (451, 'Yes', 'yes', 203);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (452, 'No', 'no', 203);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (453, 'Don''t know', 'dontknow', 203);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (454, 'Yes', 'yes', 204);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (455, 'No', 'no', 204);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (456, 'Don''t know', 'dontknow', 204);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (457, 'Yes', 'yes', 205);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (458, 'No', 'no', 205);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (459, 'Don''t know', 'dontknow', 205);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (460, 'Yes', 'yes', 206);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (461, 'No', 'no', 206);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (462, 'Don''t know', 'dontknow', 206);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (463, 'Yes', 'yes', 208);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (464, 'No', 'no', 208);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (465, 'Don''t know', 'dontknow', 208);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (466, 'Yes', 'yes', 209);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (467, 'No', 'no', 209);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (468, 'Don''t know', 'dontknow', 209);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (469, 'Nothing else', 'nothingelse', 87);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (470, 'Nothing else', 'nothingelse', 93);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (471, 'Nothing else', 'nothingelse', 99);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (472, 'Nothing else', 'nothingelse', 105);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (473, 'Nothing else', 'nothingelse', 111);
INSERT INTO adaptdb.choices (chioce_id, name, value, elements_id) VALUES (474, 'Nothing else', 'nothingelse', 117);

INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (1, 'Better or no change (1)', '1', 132);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (2, 'Questionable / occasionally worse (2)', '2', 132);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (3, 'Consistently a little worse (3)', '3', 132);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (4, 'Consistently much Worse (4)', '4', 132);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (5, 'Don''t know / Not applicable (9)', '9', 132);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (6, 'Better or no change (1)', '1', 133);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (7, 'Questionable / occasionally worse (2)', '2', 133);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (8, 'Consistently a little worse (3)', '3', 133);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (9, 'Consistently much Worse (4)', '4', 133);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (10, 'Don''t know / Not applicable (9)', '9', 133);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (11, 'Better or no change (1)', '1', 134);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (12, 'Questionable / occasionally worse (2)', '2', 134);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (13, 'Consistently a little worse (3)', '3', 134);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (14, 'Consistently much Worse (4)', '4', 134);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (15, 'Don''t know / Not applicable (9)', '9', 134);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (16, 'Better or no change  (1)', '1', 135);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (17, 'Questionable / occasionally worse (2)', '2', 135);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (18, 'Consistently a little worse (3)', '3', 135);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (19, 'Consistently much Worse (4)', '4', 135);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (20, 'Don''t know / Not applicable (9)', '9', 135);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (21, 'Better or no change (1)', '1', 136);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (22, 'Questionable / occasionally worse (2)', '2', 136);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (23, 'Consistently a little worse (3)', '3', 136);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (24, 'Consistently much Worse (4)', '4', 136);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (25, 'Don''t know / Not applicable (9)', '9', 136);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (26, 'Better or no change (1)', '1', 137);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (27, 'Questionable / occasionally worse (2)', '2', 137);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (28, 'Consistently a little worse (3)', '3', 137);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (29, 'Consistently much Worse (4)', '4', 137);
INSERT INTO adaptdb.columns (column_id, name, value, elements_id) VALUES (30, 'Don''t know / Not applicable (9)', '9', 137);

INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (118, 1, 0, '1', null, 'text', 'Height(ft)', 'left', 0, null, 'number', null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (132, 1, 0, '1', null, 'matrix', 'Compared to 10 years ago, has there been any change in Memory? *', null, 0, null, null, null, 19, 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (138, 1, 0, '1', null, 'text', '1. How old are you?', 'left', 0, null, 'number', null, 25, 16, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (198, 1, 0, '1', null, 'image', null, null, 0, null, null, null, 35, 17, null, 0, null, null, 0, null, 0, 0, null, 0, 800, 800, '/assets/excercise_v_2.png');
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (79, 1, 0, '1.1', null, 'radiogroup', 'Completed By', 'top', 2, null, null, null, 8, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (80, 1, 0, '1.2', '{1.1} = ''relative''', 'text', 'Relationship to Participant:', 'left', 0, null, null, null, 8, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (81, 1, 0, '1.3', null, 'html', null, null, 0, null, null, null, 8, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (127, 1, 0, '10', null, 'radiogroup', '2. How often do you feel tired or fatigued after your sleep?', null, 2, null, null, null, 17, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (156, 1, 0, '10', null, 'radiogroup', '10. During the past month, did you drink any coffee or tea that had sugar or honey added to it? Include coffee and tea you sweetened yourself and presweetened tea and coffee drinks such as Arizona Iced Tea and Frappuccino. Do not include artificially sweetened coffee or diet tea', null, 3, null, null, null, 28, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (207, 1, 0, '10', null, 'html', null, null, 0, null, null, null, 37, 17, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (157, 1, 0, '10.1', '{10} = ''yes''', 'radiogroup', 'During the past month, how often did you drink coffee or tea containing sugar or honey? You can report per day, per week, or per month.', null, 4, null, null, null, 28, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (128, 1, 0, '11', null, 'radiogroup', '3. During your waking time, do you feel tired, fatigued, or not up to par?', null, 2, null, null, null, 17, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (158, 1, 0, '11', null, 'radiogroup', '11. During the past month, did you drink any sweetened fruit drinks, sports or energy drinks, such as Kool-aid, lemonade, Hi-C, cranberry drink, Gatorade, Red Bull, or Vitamin Water? Include fruit juices you made at home and added sugar to. Do not include diet drinks or artificially sweetened drinks.', null, 3, null, null, null, 28, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (208, 1, 0, '11', null, 'radiogroup', '8. I do activities to increase muscle strength, such as lifting weights or calisthenics, once a week or more.', null, 3, null, null, null, 37, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (159, 1, 0, '11.1', '{11} = ''yes''', 'radiogroup', 'During the past month, how often did you drink sweetened fruit, sports or energy drinks? You can report per day, per week, or per month.', null, 4, null, null, null, 28, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (129, 1, 0, '12', null, 'radiogroup', '4. Have you ever nodded off or fallen asleep while driving a vehicle?', null, 3, null, null, null, 17, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (160, 1, 0, '12', null, 'radiogroup', '12. During the past month, did you eat any fruit? Include fresh, frozen, or canned fruit. Do not include juices.', null, 3, null, null, null, 28, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (209, 1, 0, '12', null, 'radiogroup', '9. I do activities to improve flexibility, such as stretching or yoga, once a week or more.', null, 3, null, null, null, 37, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (161, 1, 0, '12.1', '{12} = ''yes''', 'radiogroup', 'During the past month, how often did you eat fruit? You can report per day, per week, or per month', null, 4, null, null, null, 28, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (130, 1, 0, '13', '{12} = ''yes''', 'radiogroup', ' How often does this occur?', null, 2, null, null, null, 17, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (162, 1, 0, '13', null, 'radiogroup', '13. During the past month, did you eat a green leafy or lettuce salad, with or without other vegetables?', null, 3, null, null, null, 29, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (163, 1, 0, '13.1', '{13} = ''yes''', 'radiogroup', 'During the past month, how often did you eat salad? You can report per day, per week, or per month', null, 4, null, null, null, 29, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (131, 1, 0, '14', null, 'radiogroup', '5. Do you have high blood pressure?', null, 3, null, null, null, 18, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (164, 1, 0, '14', null, 'radiogroup', '14. During the past month, did you eat any kind of fried potatoes including french fries, home fries, or hash brown potatoes?', null, 3, null, null, null, 29, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (165, 1, 0, '14.1', '{14} = ''yes''', 'radiogroup', 'During the past month, how often did you eat any kind of fried potatoes? You can report per day, per week, or per month', null, 4, null, null, null, 29, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (166, 1, 0, '15', null, 'radiogroup', '15. During the past month, did you eat any other kind of potatoes, such as baked, boiled, mashed potatoes, sweet potatoes, or potato salad?', null, 3, null, null, null, 29, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (167, 1, 0, '15.1', '{15} = ''yes''', 'radiogroup', 'During the past month, how often did you eat any other kind of potatoes? You can report per day, per week, or per month', null, 4, null, null, null, 29, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (168, 1, 0, '16', null, 'radiogroup', '16. During the past month, did you eat any refried beans, baked beans, beans in soup, pork and beans or other cooked dried beans? Do not include green beans.', null, 3, null, null, null, 30, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (169, 1, 0, '16.1', '{16} = ''yes''', 'radiogroup', 'During the past month, how often did you eat refried beans, baked beans, beans in soup, pork and beans or other cooked dried beans? You can report per day, per week, or per month.', null, 4, null, null, null, 30, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (170, 1, 0, '17', null, 'radiogroup', '17. During the past month, did you eat any brown rice or other cooked whole grains, such as bulgur, cracked wheat, or millet? Do not include white rice.', null, 3, null, null, null, 30, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (171, 1, 0, '17.1', '{17} = ''yes''', 'radiogroup', 'During the past month, how often did you eat brown rice or other cooked whole grains? You can report per day, per week, or per month', null, 4, null, null, null, 30, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (172, 1, 0, '18', null, 'radiogroup', '18. During the past month, not including green salads, potatoes, and cooked dried beans, did you eat any other vegetables?', null, 3, null, null, null, 30, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (173, 1, 0, '18.1', '{18} = ''yes''', 'radiogroup', 'During the past month, how often did you eat other vegetables? You can report per day, per week, or per month', null, 4, null, null, null, 30, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (174, 1, 0, '19', null, 'radiogroup', '19. During the past month, did you eat any Mexican-type salsa made with tomato?', null, 3, null, null, null, 31, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (175, 1, 0, '19.1', '{19} = ''yes''', 'radiogroup', 'During the past month, how often did you have Mexican-type salsa made with tomato? You can report per day, per week, or per month.', null, 4, null, null, null, 31, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (119, 1, 0, '2', null, 'text', 'Weight(lbs)', 'left', 0, null, 'number', null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (133, 1, 0, '2', null, 'matrix', 'Compared to 10 years ago, has there been any change in Language? *', null, 0, null, null, null, 20, 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (139, 1, 0, '2', null, 'radiogroup', '2. Are you male or female?', null, 2, null, null, null, 25, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (199, 1, 0, '2', null, 'html', null, null, 0, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (82, 1, 0, '2.1', null, 'radiogroup', '1. Have you ever been diagnosed with a medical condition related to high or elevated blood pressure?', 'top', 0, null, null, 'Unknown', 9, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (83, 1, 0, '2.2', '{2.1} = ''yes''', 'radiogroup', 'How long have you had this condition?', null, 5, null, null, null, 9, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (84, 1, 0, '2.3', '{2.1} = ''yes''', 'radiogroup', 'Were you ever treated for this condition', 'left', 0, null, null, null, 9, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (85, 1, 0, '2.4', '{2.1} = ''yes'' and {2.3} = ''yes''', 'radiogroup', 'Are you currently treating this condition?', 'left', 0, null, null, null, 9, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (86, 1, 0, '2.5', '{2.1} = ''yes'' and {2.3} = ''yes'' and {2.4} = ''yes''', 'tagbox', 'Elevated Blood Pressure Medication/supplements', 'left', 0, 'Please select the medications you believe to be taking for this condition', null, null, 9, 13, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/medicine', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (87, 1, 1, '2.6', '{2.1} = ''yes'' and {2.3} = ''yes'' and {2.4} = ''yes''', 'checkbox', 'Other treatments', 'top', 4, null, null, null, 9, 13, null, 0, null, null, 0, null, 0, 0, '{2.5} contains ''No prescribed medications''', 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (176, 1, 0, '20', null, 'radiogroup', '20. During the past month, did you eat any pizza? Include frozen pizza, fast food pizza, and homemade pizza.', null, 3, null, null, null, 31, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (177, 1, 0, '20.1', '{20} = ''yes''', 'radiogroup', 'During the past month, how often did you eat pizza? You can report per day, per week, or per month', null, 4, null, null, null, 31, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (178, 1, 0, '21', null, 'radiogroup', '21. During the past month, did you have any tomato sauces such as with spaghetti or noodles or mixed into foods such as lasagna? (Do not count tomato sauce on pizza.)', null, 3, null, null, null, 31, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (179, 1, 0, '21.1', '{21} = ''yes''', 'radiogroup', 'During the past month, how often did you have tomato sauces? You can report per day, per week, or per month.', null, 4, null, null, null, 31, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (180, 1, 0, '22', null, 'radiogroup', '22. During the past month, did you eat any kind of cheese? Include cheese as a snack, cheese on burgers, sandwiches, and cheese in foods such as lasagna, quesadillas, or casseroles. Do not include cheese on pizza', null, 3, null, null, null, 32, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (181, 1, 0, '22.1', '{22} = ''yes''', 'radiogroup', 'During the past month, how often did you eat any kind of cheese? You can report per day, per week, or per month', null, 4, null, null, null, 32, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (182, 1, 0, '23', null, 'radiogroup', '23. During the past month, did you eat any red meat, such as beef, pork, ham, or sausage? Do not include chicken, turkey or seafood. Include red meat you had in sandwiches, lasagna, stew, and other mixtures. Red meats may also include veal, lamb, and any lunch meats made with these meats.', null, 3, null, null, null, 32, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (183, 1, 0, '23.1', '{23} = ''yes''', 'radiogroup', 'During the past month, how often did you eat red meat? You can report per day, per week, or per month.', null, 4, null, null, null, 32, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (184, 1, 0, '24', null, 'radiogroup', '24. During the past month, did you eat any processed meat, such as bacon, lunch meats, or hot dogs? Include processed meats you had in sandwiches, soups, pizza, casseroles, and other mixtures. Processed meats are those preserved by smoking, curing, or salting, or by the addition of preservatives. Examples are: ham, bacon, pastrami, salami, sausages, bratwursts, frankfurters, hot dogs, and spam', null, 3, null, null, null, 32, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (185, 1, 0, '24.1', '{24} = ''yes''', 'radiogroup', 'During the past month, how often did you eat processed meat? You can report per day, per week, or per month.', null, 4, null, null, null, 32, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (186, 1, 0, '25', null, 'radiogroup', '25. During the past month, did you eat any whole grain bread including toast, rolls and in sandwiches? Whole grain breads include whole wheat, rye, oatmeal and pumpernickel. Do not include white bread.', null, 3, null, null, null, 33, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (187, 1, 0, '25.1', '{25} = ''yes''', 'radiogroup', 'During the past month, how often did you eat whole grain bread? You can report per day, per week, or per month.', null, 4, null, null, null, 33, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (188, 1, 0, '26', null, 'radiogroup', '26. During the past month, did you eat any chocolate or any other types of candy? Do not include sugar-free candy.', null, 3, null, null, null, 33, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (189, 1, 0, '26.1', '{26} = ''yes''', 'radiogroup', 'During the past month, how often did you eat chocolate or any other types of candy? You can report per day, per week, or per month.', null, 4, null, null, null, 33, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (190, 1, 0, '27', null, 'radiogroup', '27. During the past month, did you eat any doughnuts, sweet rolls, Danish, muffins, (pan dulce) or pop-tarts? Do not include sugar-free items.', null, 3, null, null, null, 33, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (191, 1, 0, '27.1', '{27} = ''yes''', 'radiogroup', 'During the past month, how often did you eat doughnuts, sweet rolls, Danish, muffins, (pan dulce) or pop-tarts? You can report per day, per week, or per month.', null, 4, null, null, null, 33, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (192, 1, 0, '28', null, 'radiogroup', '28. During the past month, did you eat any cookies, cake, pie, or brownies? Do not include sugar-free kinds.', null, 3, null, null, null, 34, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (193, 1, 0, '28.1', '{28} = ''yes''', 'radiogroup', 'During the past month, how often did you eat cookies, cake, pie, or brownies? You can report per day, per week, or per month.', null, 4, null, null, null, 34, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (194, 1, 0, '29', null, 'radiogroup', '29. During the past month, did you eat any ice cream or other frozen desserts? Do not include sugar-free kinds.', null, 3, null, null, null, 34, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (195, 1, 0, '29.1', '{29} = ''yes''', 'radiogroup', 'During the past month, how often did you eat ice cream or other frozen desserts? You can report per day, per week, or per month', null, 4, null, null, null, 34, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (120, 1, 0, '3', null, 'text', 'Age', 'left', 0, null, 'number', null, 15, 14, null, 0, null, null, 0, null, 1, 200, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (134, 1, 0, '3', null, 'matrix', 'Compared to 10 years ago, has there been any change in Visual-Spatial and Perceptual Abilities? *', null, 0, null, null, null, 21, 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (140, 1, 0, '3', null, 'radiogroup', '3. During the past month, did you eat any hot or cold cereals?', null, 3, null, null, null, 25, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (200, 1, 0, '3', null, 'radiogroup', '1. I rarely or never do any physical activities.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (88, 1, 0, '3.1', null, 'radiogroup', '2. Have you ever been diagnosed with a medical condition related to high or elevated cholesterol levels?', 'top', 0, null, null, 'Unknown', 10, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (141, 1, 0, '3.1', '{3} = ''yes''', 'radiogroup', ' During the past month, how often did you eat hot or cold cereals? You can report per day, per week, or per month.
', null, 4, null, null, null, 25, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (89, 1, 0, '3.2', '{3.1} = ''yes''', 'radiogroup', 'How long have you had this condition?', null, 5, null, null, null, 10, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (90, 1, 0, '3.3', '{3.1} = ''yes''', 'radiogroup', 'Were you ever treated for this condition', 'left', 0, null, null, null, 10, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (91, 1, 0, '3.4', '{3.1} = ''yes'' and {3.3} = ''yes''', 'radiogroup', 'Are you currently treating this condition?', 'left', 0, null, null, null, 10, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (92, 1, 0, '3.5', '{3.1} = ''yes'' and {3.3} = ''yes'' and {3.4} = ''yes''', 'tagbox', 'Elevated cholesterol Medication/supplements', 'left', 0, 'please select the medications you believe to be taking for this condition', null, null, 10, 13, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/medicine', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (93, 1, 1, '3.6', '{3.1} = ''yes'' and {3.3} = ''yes'' and {3.4} = ''yes''', 'checkbox', 'Other treatments', 'top', 4, null, null, null, 10, 13, null, 0, null, null, 0, null, 0, 0, '{3.5} contains ''No prescribed medications''', 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (196, 1, 0, '30', null, 'radiogroup', '30. During the past month, did you eat any popcorn?', null, 3, null, null, null, 34, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (197, 1, 0, '30.1', '{30} = ''yes''', 'radiogroup', 'During the past month, how often did you eat popcorn? You can report per day, per week, or per month.', null, 4, null, null, null, 34, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (121, 1, 0, '4', null, 'radiogroup', 'Sex:', 'left', 2, null, null, null, 15, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (135, 1, 0, '4', null, 'matrix', 'Compared to 10 years ago, has there been any change in Executive Functioning: Planning? *', null, 0, null, null, null, 22, 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (142, 1, 1, '4', null, 'radiogroup', '4. During the past month, what kind of cereal did you usually eat?  ', null, 3, null, null, 'Other  Cereal(describe)', 26, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (201, 1, 0, '4', null, 'radiogroup', '2. I do some light or moderate physical activities, but not every week.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (94, 1, 0, '4.1', null, 'radiogroup', '3. Have you ever been diagnosed with a medical condition related to Diabetes Mellitus?', 'top', 0, null, null, 'Unknown', 11, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (143, 1, 1, '4.1', '{4} = ''hotcereal''', 'tagbox', 'Please select the type of Hot Cereal', 'left', 0, null, null, 'Type of Other Hot Cereal(describe)', 26, 16, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/cerealList', 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (95, 1, 0, '4.2', '{4.1} = ''yes''', 'radiogroup', 'How long have you had this condition?', null, 5, null, null, null, 11, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (144, 1, 1, '4.2', '{4} = ''coldcereal''', 'tagbox', 'Please select the type of Cold Cereal', 'left', 0, null, null, 'Type of Other Cold Cereal(describe)', 26, 16, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/cerealList', 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (96, 1, 0, '4.3', '{4.1} = ''yes''', 'radiogroup', 'Were you ever treated for this condition', 'left', 0, null, null, null, 11, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (97, 1, 0, '4.4', '{4.1} = ''yes'' and {4.3} = ''yes''', 'radiogroup', 'Are you currently treating this condition?', 'left', 0, null, null, null, 11, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (98, 1, 0, '4.5', '{4.1} = ''yes'' and {4.3} = ''yes'' and {4.4} = ''yes''', 'tagbox', 'Diabetes Mellitus Medication/supplements', 'left', 0, 'please select the medications you believe to be taking for this condition', null, null, 11, 13, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/medicine', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (99, 1, 1, '4.6', '{4.1} = ''yes'' and {4.3} = ''yes'' and {4.4} = ''yes''', 'checkbox', 'Other treatments', 'top', 4, null, null, null, 11, 13, null, 0, null, null, 0, null, 0, 0, '{4.5} contains ''No prescribed medications''', 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (122, 1, 0, '5', null, 'radiogroup', '1. Do you snore?', null, 3, null, null, null, 16, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (136, 1, 0, '5', null, 'matrix', 'Compared to 10 years ago, has there been any change in Executive Functioning: Organization? *', null, 0, null, null, null, 23, 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (145, 1, 0, '5', null, 'radiogroup', '5. Was there another second cereal that you usually ate?', null, 3, null, null, null, 26, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (202, 1, 0, '5', null, 'radiogroup', '3. I do some light physical activity every week.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (100, 1, 0, '5.1', null, 'radiogroup', '4. Have you ever been diagnosed with a medical condition related to kidney health or function?', 'top', 0, null, null, 'Unknown', 12, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (146, 1, 1, '5.1', '{5} = ''yes''', 'radiogroup', 'During the past month, what kind of second cereal did you usually eat?  ', null, 3, null, null, 'Other  Cereal(describe)', 26, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (101, 1, 0, '5.2', '{5.1} = ''yes''', 'radiogroup', 'How long have you had this condition?', null, 5, null, null, null, 12, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (147, 1, 1, '5.2', '{5} = ''yes'' and {5.1} = ''hotcereal''', 'tagbox', 'Please select the type of Hot Cereal', 'left', 0, null, null, 'Type of Other Hot Cereal(describe)', 26, 16, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/cerealList', 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (102, 1, 0, '5.3', '{5.1} = ''yes''', 'radiogroup', 'Were you ever treated for this condition', 'left', 0, null, null, null, 12, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (148, 1, 1, '5.3', '{5} = ''yes'' and {5.1} = ''coldcereal''', 'tagbox', 'Please select the type of Cold Cereal', 'left', 0, null, null, 'Type of Other Cold Cereal(describe)', 26, 16, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/cerealList', 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (103, 1, 0, '5.4', '{5.1} = ''yes'' and {5.3} = ''yes''', 'radiogroup', 'Are you currently treating this condition?', 'left', 0, null, null, null, 12, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (104, 1, 0, '5.5', '{5.1} = ''yes'' and {5.3} = ''yes'' and {5.4} = ''yes''', 'tagbox', 'Kidney Medication/supplements', 'left', 0, 'Please select the medications you believe to be taking for this condition', null, null, 12, 13, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/medicine', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (105, 1, 1, '5.6', '{5.1} = ''yes'' and {5.3} = ''yes'' and {5.4} = ''yes''', 'checkbox', 'Other treatments', 'top', 4, null, null, null, 12, 13, null, 0, null, null, 0, null, 0, 0, '{5.5} contains ''No prescribed medications''', 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (123, 1, 0, '6', '{5} = ''yes''', 'radiogroup', 'Your snoring is:', null, 2, null, null, null, 16, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (137, 1, 0, '6', null, 'matrix', 'Compared to 10 years ago, has there been any change in Executive Functioning: Divided Attention? *', null, 0, null, null, null, 24, 15, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (149, 1, 0, '6', null, 'radiogroup', '6. During the past month, did you have any milk (either to drink or on cereal)? Include regular milks, chocolate or other flavored milks, lactose-free milk, buttermilk. Do not include soy milk or small amounts of milk in coffee or tea.', null, 3, null, null, null, 26, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (203, 1, 0, '6', null, 'radiogroup', '4. I do moderate physical activities every week, but less than 30 minutes a day or 5 days a week.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (106, 1, 0, '6.1', null, 'radiogroup', '5. Have you ever been diagnosed with a medical condition related to heart health or function?', 'top', 0, null, null, 'Unknown', 13, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (150, 1, 0, '6.1', '{6} = ''yes''', 'radiogroup', 'During the past month, how often did you have any milk (either to drink or on cereal)? You
               can report per day, per week, or per month.
', null, 4, null, null, null, 26, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (107, 1, 0, '6.2', '{6.1} = ''yes''', 'radiogroup', 'How long have you had this condition?', null, 5, null, null, null, 13, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (108, 1, 0, '6.3', '{6.1} = ''yes''', 'radiogroup', 'Were you ever treated for this condition', 'left', 0, null, null, null, 13, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (109, 1, 0, '6.4', '{6.1} = ''yes'' and {6.3} = ''yes''', 'radiogroup', 'Are you currently treating this condition?', 'left', 0, null, null, null, 13, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (110, 1, 0, '6.5', '{6.1} = ''yes'' and {6.3} = ''yes'' and {6.4} = ''yes''', 'tagbox', 'Heart Medication/supplements', 'left', 0, 'Please select the medications you believe to be taking for this condition', null, null, 13, 13, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/medicine', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (111, 1, 1, '6.6', '{6.1} = ''yes'' and {6.3} = ''yes'' and {6.4} = ''yes''', 'checkbox', 'Other treatments', 'top', 4, null, null, null, 13, 13, null, 0, null, null, 0, null, 0, 0, '{6.5} contains ''No prescribed medications''', 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (124, 1, 0, '7', '{5} = ''yes''', 'radiogroup', 'How often do you snore?', null, 2, null, null, null, 16, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (151, 1, 1, '7', null, 'radiogroup', '7. During the past month, what kind of milk did you usually drink?', null, 3, null, null, null, 27, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (204, 1, 0, '7', null, 'radiogroup', '5. I do vigorous physical activities every week, but less than 20 minutes a day or 3 days a week.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (112, 1, 0, '7.1', null, 'radiogroup', '6. Have you ever been diagnosed with a medical condition related to artery/vascular health or function?', 'top', 0, null, null, 'Unknown', 14, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (113, 1, 0, '7.2', '{7.1} = ''yes''', 'radiogroup', 'How long have you had this condition?', null, 5, null, null, null, 14, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (114, 1, 0, '7.3', '{7.1} = ''yes''', 'radiogroup', 'Were you ever treated for this condition', 'left', 0, null, null, null, 14, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (115, 1, 0, '7.4', '{7.1} = ''yes'' and {7.3} = ''yes''', 'radiogroup', 'Are you currently treating this condition?', 'left', 0, null, null, null, 14, 13, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (116, 1, 0, '7.5', '{7.1} = ''yes'' and {7.3} = ''yes'' and {7.4} = ''yes''', 'tagbox', 'Vascular Medication/supplements', 'left', 0, 'please select the medications you believe to be taking for this condition', null, null, 14, 13, 'http://adaptboot-env.eba-ty3ytask.us-east-2.elasticbeanstalk.com/api/adapt/questionnaire/medicine', 0, null, 'select2', 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (117, 1, 1, '7.6', '{7.1} = ''yes'' and {7.3} = ''yes'' and {7.4} = ''yes''', 'checkbox', 'Other treatments', 'top', 4, null, null, null, 14, 13, null, 0, null, null, 0, null, 0, 0, '{7.5} contains ''No prescribed medications''', 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (125, 1, 0, '8', '{5} = ''yes''', 'radiogroup', 'Has your snoring ever bothered other people?', null, 3, null, null, null, 16, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (152, 1, 0, '8', null, 'radiogroup', '8. During the past month, did you drink any regular soda or pop that contains sugar?  Do not include diet soda', null, 3, null, null, null, 27, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (205, 1, 0, '8', null, 'radiogroup', '6. I do 30 minutes or more a day of moderate physical activities, 5 or more days a week.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (153, 1, 0, '8.1', '{8} = ''yes''', 'radiogroup', 'During the past month, how often did you drink regular soda or pop? You can report per
               day, per week, or per month
', null, 4, null, null, null, 27, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (126, 1, 0, '9', '{5} = ''yes''', 'radiogroup', 'Has anyone noticed that you quit breathing during your sleep?', null, 2, null, null, null, 16, 14, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (154, 1, 0, '9', null, 'radiogroup', '9. During the past month, did you drink any 100% pure fruit juices such as orange, mango, apple, grape and pineapple juices? Do not include fruit-flavored drinks with added sugar or fruit juice you made at home and added sugar to', null, 3, null, null, null, 27, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (206, 1, 0, '9', null, 'radiogroup', '7. I do 20 minutes or more a day of vigorous physical activities, 3 or more days a week.', null, 3, null, null, null, 36, 17, null, 0, null, null, 0, null, 0, 0, null, 2, null, null, null);
INSERT INTO adaptdb.elements (elements_id, start_with_new_line, has_other, name, visible_if, type, title, title_location, col_count, description, input_type, other_text, page_id, questionnaires_id, choices_by_url, is_required, enable_if, render_as, is_all_row_required, default_value, min, max, required_if, indent, image_height, image_width, image_link) VALUES (155, 1, 0, '9.1', '{9} = ''yes''', 'radiogroup', 'During the past month, how often did you drink 100% pure fruit juice? You can report per day, per week, or per month.', null, 4, null, null, null, 27, 16, null, 0, null, null, 0, null, 0, 0, null, 0, null, null, null);


INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (24, 'attentionpage', 'Compared to 10 years ago, has there been any change in... ', 15);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (17, 'category2', 'CATEGORY 2', 14);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (18, 'category3', 'CATEGORY 3', 14);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (16, 'cetegory1', 'CATEGORY 1', 14);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (11, 'DiabetesMellitus', 'Diabetes mellitus check', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (13, 'hearthealthpage', 'Heart health check', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (9, 'HighBloodPressurePage', 'High blood pressure check', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (10, 'HighcholesterolPage', 'High cholesterol check', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (8, 'IntroductionPage', 'Introduction', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (35, 'intropage', null, 17);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (12, 'KidneyHealthPage', 'Kidney health check', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (20, 'Languagepage', 'Compared to 10 years ago, has there been any change in... ', 15);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (19, 'memorypage', 'Compared to 10 years ago, has there been any change in... ', 15);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (23, 'organizationpage', 'Compared to 10 years ago, has there been any change in... ', 15);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (27, 'pag3', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (25, 'page1', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (34, 'page10', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (26, 'page2', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (28, 'page4', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (29, 'page5', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (30, 'page6', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (31, 'page7', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (32, 'page8', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (33, 'page9', null, 16);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (15, 'personalinfopage', 'Personal Info', 14);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (22, 'planningpage', 'Compared to 10 years ago, has there been any change in... ', 15);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (36, 'rapa1', 'RAPA 1', 17);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (37, 'rapa2', 'RAPA 2', 17);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (14, 'vascularhealthpage', 'Vascular health check', 13);
INSERT INTO adaptdb.pages (page_id, name, title, questionnaires_id) VALUES (21, 'visualpage', 'Compared to 10 years ago, has there been any change in... ', 15);

INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (1, '{3}==''yes''', '4', 'no', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (2, '{3}==''no'' or {3}==''dontknow''', '4', 'null', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (3, '{3}==''yes''', '5', 'no', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (4, '{3}==''no'' or {3}==''dontknow''', '5', 'null', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (5, '{3}==''yes''', '6', 'no', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (6, '{3}==''no'' or {3}==''dontknow''', '6', 'null', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (7, '{3}==''yes''', '7', 'no', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (8, '{3}==''no'' or {3}==''dontknow''', '7', 'null', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (9, '{3}==''yes''', '8', 'no', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (10, '{3}==''no'' or {3}==''dontknow''', '8', 'null', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (11, '{3}==''yes''', '9', 'no', 'setvalue', 17);
INSERT INTO adaptdb.questionnaire_triggers (questionnaire_trigger_id, expression, set_to_name, set_value, type, questionnaires_id) VALUES (12, '{3}==''no'' or {3}==''dontknow''', '9', 'null', 'setvalue', 17);

INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (1, '1. Remembering a few shopping items without a list.', '1', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (2, '2. Remembering things that happened recently (such as recent outings, events in the news).', '2', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (3, '3. Recalling conversations a few days later.', '3', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (4, '4. Remembering where you have placed personal items or objects.', '4', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (5, '5. Unknowingly repeating stories and/or questions multiple times.', '5', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (6, '6. Remembering the current date or day of the week.', '6', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (7, '7. Remembering that you have already told someone something.', '7', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (8, '8. Remembering appointments, meetings, or engagements.', '8', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (9, '9. Remembering to do important tasks like pay bills or take medications. ', '9', 132);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (10, '1. Coming up with the right names of commonly used everyday objects (e.g., telephone, toothbrush).', '1', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (11, '2. Verbally giving instructions to others.', '2', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (12, '3. Finding the exact right words to use in a conversation.', '3', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (13, '4. Communicating or expressing ideas in a conversation.', '4', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (14, '5. Following a story in a book or on TV.', '5', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (15, '6. Understanding the point of what other people are trying to say.', '6', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (16, '7. Remembering the meaning of common words.', '7', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (17, '8. Describing a program you have watched on TV.', '8', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (18, '9. Understanding spoken directions or instructions.', '9', 133);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (19, '1. Increased reliance on using electronic navigational aids (like GPS on a smart phone) to find your way around town.', '1', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (20, '2. Finding your car in a parking lot.', '2', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (21, '3. Finding the way to a familiar location (e.g., a long-term friend''s home).', '3', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (22, '4. Finding your way around your own neighborhood.  ', '4', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (23, '5. Finding your way around a familiar store or other building.', '5', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (24, '6. Finding your way around a familiar home. ', '6', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (25, '7. Use of landmarks in the environment to find locations (e.g., turn left after the grocery store).', '7', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (26, '8. Difficulty perceiving distances when driving or driving too close to another vehicle or other object. ', '8', 134);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (27, '1. Planning the sequence of stops on a shopping trip.', '1', 135);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (28, '2. The ability to anticipate weather changes and plan accordingly (e.g., bring a coat or umbrella).', '2', 135);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (29, '3. Planning and sticking to a schedule for the day when there are several things to be done.', '3', 135);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (30, '4. Thinking things through before making a major decision (e.g., making a big purchase).', '4', 135);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (31, '5.  Planning a trip, vacation, or outing.', '5', 135);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (32, '1. Keeping living and work space (such as a home office, garage or pantry) organized.', '1', 136);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (33, '2.  Managing bill payments.', '2', 136);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (34, '3. Keeping financial records or other documents organized so they are easy to find when needed.', '3', 136);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (35, '4. Prioritizing tasks by importance (doing the most important things first).', '4', 136);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (36, '5. Keeping mail and papers organized.', '5', 136);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (37, '6. Using an organized strategy to manage a medication schedule involving multiple medications.', '6', 136);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (38, '1. The ability to do two things at once.', '1', 137);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (39, '2. Returning to a task after being interrupted.', '2', 137);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (40, '3. The ability to concentrate on and complete a task without being distracted by other things.', '3', 137);
INSERT INTO adaptdb.rows (row_id, name, value, elements_id) VALUES (41, '4. Working on a particular task while talking to someone at the same time.', '4', 137);

DROP TABLE IF EXISTS adaptdb.site;

CREATE TABLE
    adaptdb.site
    (
        site_id INT NOT NULL,
        site VARCHAR(25) NOT NULL,
        site_name VARCHAR(255) NOT NULL,
		nacc_id INT NOT NULL,
        PRIMARY KEY (site_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (1, 'UC Davis', 'University of California at Davis', 16);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (2, 'Rush', 'Rush University', 10);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (3, 'JHMI - John Hopkins', 'Johns Hopkins Medicine International', 9);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (4, 'UCSD - San Diego', 'University of California at San Diego', 18);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (5, 'UPENN- Pennsylvania', 'University of Pennsylvania', 21);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (6, 'USC - Southern California', 'University of Southern California', 30);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (7, 'Wisconsin', 'Wisconsin University', 37);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (8, 'UM Michigan', 'University of Michigan', 43);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (9, 'New Mexico', 'University of New Mexico', 48);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (10, 'UTH SCSA - San Antonio', 'University of Texas Health Science Center at San Antonio - UT Health San Antonio', 67);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (11, 'Kentucky', 'University of Kentucky', 19);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (12, 'Columbia', 'University of Columbia', 4);
INSERT INTO adaptdb.site (site_id, site, site_name, nacc_id) VALUES (13, 'Wake Forest', 'University of Wake Forest', 42);

DROP TABLE IF EXISTS adaptdb.participant_email;

CREATE TABLE
    adaptdb.participant_email
    (
        participant_email_id INT NOT NULL AUTO_INCREMENT,
        participant_id INT NOT NULL,
        email VARCHAR(255),
        PRIMARY KEY (participant_email_id),
        CONSTRAINT participantemail_fk1 FOREIGN KEY (participant_id) REFERENCES
        adaptdb.participants (participant_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=latin1;

commit;
