update adaptdb.elements set choices_by_url = 'http://localhost:8080/api/adapt/questionnaire/cerealList' where elements_id in (143, 144, 147, 148);
update adaptdb.elements set choices_by_url = 'http://localhost:8080/api/adapt/questionnaire/medicine' where elements_id in (86, 92, 98, 104, 110, 116);
update adaptdb.elements set image_link = 'assets/excercise_v_2.png' where elements_id = 198;
commit;
