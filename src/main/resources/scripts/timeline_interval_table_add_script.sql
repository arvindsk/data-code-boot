CREATE TABLE adaptdb.`timeline_interval` (
  `timeline_interval_id` int(11) NOT NULL,
  `timeline_name` varchar(45) DEFAULT NULL,
  `interval_in_months` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`timeline_interval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO adaptdb.`timeline_interval` (`timeline_interval_id`,`timeline_name`,`interval_in_months`,`comments`) VALUES (1,'followup1_enabled',10,'follow up 1 will be enabled - if current date is after [first submission date+ 10 months]');
INSERT INTO adaptdb.`timeline_interval` (`timeline_interval_id`,`timeline_name`,`interval_in_months`,`comments`) VALUES (2,'followup1_disabled',20,'follow up 1 will be disabled- if current date is after [first submission date+ 20 months]');
INSERT INTO adaptdb.`timeline_interval` (`timeline_interval_id`,`timeline_name`,`interval_in_months`,`comments`) VALUES (3,'followup2_enabled',24,'follow up 2 will be enabled - if current date is after [first submission date+24 months]');
INSERT INTO adaptdb.`timeline_interval` (`timeline_interval_id`,`timeline_name`,`interval_in_months`,`comments`) VALUES (4,'followup2_disabled',34,' follow up 2 will be disabled- if current date is after [first submission date+34 months]');
