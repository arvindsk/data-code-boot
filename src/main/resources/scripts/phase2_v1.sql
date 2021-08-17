ALTER TABLE
    adaptdb.participant_study ADD (access VARCHAR(255));
ALTER TABLE
    adaptdb.participant_study ADD (quid VARCHAR(255));

CREATE TABLE
    adaptdb.participant_email
    (
        participant_email_id INT NOT NULL,
        participant_id INT NOT NULL,
        email VARCHAR(255),
        PRIMARY KEY (participant_email_id),
        CONSTRAINT participantemail_fk1 FOREIGN KEY (participant_id) REFERENCES
        adaptdb.participants (participant_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=latin1
