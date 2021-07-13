/*
 * Changes:
 * 1. Added a table MS_USER_DATA. This will store the Message Store UI application related user data.
 * 2. Created bulk ingestion tables which will be used to support water marking.
 * 3. Added a column CONNECT_ERR to MS_MSG_EVNT, MS_BLK_EVNT and MS_RCRD_EVNT Tables. this will store the connect error.
 * 4. Created tagging tables which will be used to support message playback.
 */


/*
* ************** 1. Added a table MS_USER_DATA. This will store the Message Store UI application related user data. ****************
*/

CREATE TABLE MS_USER_DATA
(
	USER_ID		VARCHAR2(255)	PRIMARY KEY ,
	USER_DATA	VARCHAR2(4000)	NOT NULL ,
	CREATED_AT	TIMESTAMP		NOT NULL
);

/*
* ************** 2. Create bulk ingestion related schema 
*/
CREATE TABLE MS_INGSTN_RCRD 
(
    INGSTN_RCRD_ID  NUMBER(16) GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 NOCACHE ) NOT NULL,
    CRTD_AT        TIMESTAMP NOT NULL,
    SRVC_NAME      VARCHAR2(255) NOT NULL,
    SRVC_INST      VARCHAR2(255),
	BULK_ID		   VARCHAR2(255) NOT NULL,
    BLK_LOC        VARCHAR2(255) NOT NULL    
);

COMMENT ON TABLE MS_INGSTN_RCRD IS
    'Table that saves bulk ingestion records';

ALTER TABLE MS_INGSTN_RCRD ADD CONSTRAINT INGSTN_RCRD_ID_PK PRIMARY KEY ( INGSTN_RCRD_ID );

ALTER TABLE MS_INGSTN_RCRD ADD CONSTRAINT INGSTN_RCRD_UK UNIQUE ( SRVC_NAME, BULK_ID );

CREATE TABLE MS_BLK_INGSTN 
(
    BLK_INGSTN_ID  NUMBER(16) GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 NOCACHE ) NOT NULL,
    LST_INGSTD_AT  TIMESTAMP NOT NULL,
    BLK_INGSTN_RCRD_ID        NUMBER(16) NOT NULL,
    ING_SRVC_NAME      VARCHAR2(255) NOT NULL,
    CUR_POS            NUMBER(16) NOT NULL    
);

COMMENT ON TABLE MS_BLK_INGSTN IS
    'Table that keeps track of the bulk ingestions';

ALTER TABLE MS_BLK_INGSTN ADD CONSTRAINT BLK_INGSTN_ID_PK PRIMARY KEY ( BLK_INGSTN_ID );

ALTER TABLE MS_BLK_INGSTN ADD CONSTRAINT BLK_INGSTN_UK UNIQUE ( BLK_INGSTN_RCRD_ID, ING_SRVC_NAME );

ALTER TABLE MS_BLK_INGSTN ADD CONSTRAINT MS_BULK_INGSTN_FK FOREIGN KEY ( BLK_INGSTN_RCRD_ID ) REFERENCES MS_INGSTN_RCRD ( INGSTN_RCRD_ID ) ON DELETE CASCADE;

CREATE TABLE MS_BLK_INGSTN_EVNT 
(
    BLK_INGSTN_EVNT_ID        NUMBER(16) GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 NOCACHE ) NOT NULL,
	BLK_INGSTN_ID        NUMBER(16) NOT NULL,
    INGSTD_AT  TIMESTAMP NOT NULL,
    ING_SRVC_INST      VARCHAR2(255),    
    STRT_POS       NUMBER(16) NOT NULL,
    END_POS       NUMBER(16) NOT NULL
);

COMMENT ON TABLE MS_BLK_INGSTN_EVNT IS
    'Table that captures the ingestion events of a service';

ALTER TABLE MS_BLK_INGSTN_EVNT ADD CONSTRAINT MS_BULK_INGSTN_EVNT_FK FOREIGN KEY ( BLK_INGSTN_ID ) REFERENCES MS_BLK_INGSTN ( BLK_INGSTN_ID ) ON DELETE CASCADE;


/********* Adding CONNECT_ERR column to MS_MSG_EVNT *********/

ALTER TABLE MS_MSG_EVNT ADD CONNECT_ERR CLOB;

/********* Adding CONNECT_ERR column to MS_BLK_EVNT *********/

ALTER TABLE MS_BLK_EVNT ADD CONNECT_ERR CLOB;

/********* Adding CONNECT_ERR column to MS_RCRD_EVNT *********/

ALTER TABLE MS_RCRD_EVNT ADD CONNECT_ERR CLOB;

/*
* ************** 3. Create message tagging related schema ****************
*/

CREATE TABLE MS_TAG
(
    TAG_ID      NUMERIC(16) GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 NOCACHE ) NOT NULL,
	TAG_NAME    VARCHAR2(255) NOT NULL
);

ALTER TABLE MS_TAG ADD CONSTRAINT TAG_ID_PK PRIMARY KEY ( TAG_ID );

ALTER TABLE MS_TAG ADD CONSTRAINT TAG_UK UNIQUE ( TAG_NAME );

COMMENT ON TABLE MS_TAG IS
    'Table that maintains tags for grouping messages';

CREATE TABLE MS_MSG_TAG
(
    MS_TAG_ID       NUMERIC(16) GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 NOCACHE ) NOT NULL,
	TAG_ID          NUMERIC(16) NOT NULL,
	MSG_HDR_ID      NUMERIC(16) NOT NULL
);

ALTER TABLE MS_MSG_TAG ADD CONSTRAINT MS_TAG_ID_PK PRIMARY KEY ( MS_TAG_ID );

ALTER TABLE MS_MSG_TAG ADD CONSTRAINT MSG_TAG_UK UNIQUE ( TAG_ID, MSG_HDR_ID );

ALTER TABLE MS_MSG_TAG ADD CONSTRAINT TAG_FK FOREIGN KEY ( TAG_ID ) REFERENCES MS_TAG ( TAG_ID ) ON DELETE CASCADE;

ALTER TABLE MS_MSG_TAG ADD CONSTRAINT MSG_HDR_FK FOREIGN KEY (MSG_HDR_ID ) REFERENCES MS_MSG_HDR ( MSG_HDR_ID ) ON DELETE CASCADE;

COMMENT ON TABLE MS_MSG_TAG IS
    'Table that assigns messages to tag';

/*
* ************** 4. Add the current message store schema version. ****************
*/
INSERT INTO MS_VER(VER, CRTD_AT) VALUES('2020.3.0', CURRENT_TIMESTAMP);
COMMIT;

