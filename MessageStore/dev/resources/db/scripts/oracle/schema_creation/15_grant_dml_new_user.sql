DEFINE CONNECT_MS_APP = 'CONNECT_MS_APP';
DEFINE SCHEMAOWNER = 'CONNECT_MS.';

--- Create Synonym for the tables
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_MSG_BDY FOR &SCHEMAOWNER.MS_MSG_BDY;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_MSG_EVNT FOR &SCHEMAOWNER.MS_MSG_EVNT;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_MSG_HDR FOR &SCHEMAOWNER.MS_MSG_HDR;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_SRVC FOR &SCHEMAOWNER.MS_SRVC;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_RPLYBL_MSGS FOR &SCHEMAOWNER.MS_RPLYBL_MSGS;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_MSG_TAG FOR &SCHEMAOWNER.MS_MSG_TAG;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_TAG FOR &SCHEMAOWNER.MS_TAG;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_RCRD_EVNT FOR &SCHEMAOWNER.MS_RCRD_EVNT;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_RCRD_HDR FOR &SCHEMAOWNER.MS_RCRD_HDR;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_BLK_EVNT FOR &SCHEMAOWNER.MS_BLK_EVNT;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_BLK_HDR FOR &SCHEMAOWNER.MS_BLK_HDR;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_VER FOR &SCHEMAOWNER.MS_VER;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_BLK_INGSTN_EVNT FOR &SCHEMAOWNER.MS_BLK_INGSTN_EVNT;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_BLK_INGSTN FOR &SCHEMAOWNER.MS_BLK_INGSTN;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_INGSTN_RCRD FOR &SCHEMAOWNER.MS_INGSTN_RCRD;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.MS_USER_DATA FOR &SCHEMAOWNER.MS_USER_DATA;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.messageHeaderToDelete FOR &SCHEMAOWNER.messageHeaderToDelete;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.headerToProcess FOR &SCHEMAOWNER.headerToProcess;

-- Grants below permission to APP user.
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_MSG_TAG TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_TAG TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_RPLYBL_MSGS TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_MSG_EVNT TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_MSG_HDR TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_MSG_BDY TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_SRVC TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_RCRD_EVNT TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_RCRD_HDR TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_BLK_EVNT TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_BLK_HDR TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_VER TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_BLK_INGSTN_EVNT TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_BLK_INGSTN TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_INGSTN_RCRD TO &CONNECT_MS_APP;
GRANT SELECT, INSERT, UPDATE, DELETE ON &SCHEMAOWNER.MS_USER_DATA TO &CONNECT_MS_APP;

--- Create Synonyms for Store Procedures
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_get_events FOR &SCHEMAOWNER.ms_get_events;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_get_message_by_id FOR &SCHEMAOWNER.ms_get_message_by_id;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_post_messages FOR &SCHEMAOWNER.ms_post_messages;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_post_events FOR &SCHEMAOWNER.ms_post_events;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.prepareToPurge FOR &SCHEMAOWNER.prepareToPurge;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.purgeMessages FOR &SCHEMAOWNER.purgeMessages;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_post_bulk_header FOR &SCHEMAOWNER.ms_post_bulk_header;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_post_bulk_header_events FOR &SCHEMAOWNER.ms_post_bulk_header_events;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_post_bulk_record_header FOR &SCHEMAOWNER.ms_post_bulk_record_header;
CREATE OR REPLACE SYNONYM CONNECT_MS_APP.ms_post_bulk_record_header_event FOR &SCHEMAOWNER.ms_post_bulk_record_header_event;

GRANT EXECUTE ON &SCHEMAOWNER.ms_get_events TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_get_message_by_id TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_post_events TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_post_messages TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.prepareToPurge TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.purgeMessages TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_post_bulk_header TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_post_bulk_header_events TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_post_bulk_record_header TO &CONNECT_MS_APP;
GRANT EXECUTE ON &SCHEMAOWNER.ms_post_bulk_record_header_event TO &CONNECT_MS_APP;

--Execute this grant only if data migration script is needed. please folow the ReadMe under db/scripts/oracle/schema_operations/migration/2021.1.0 before executing below grant.

--CREATE OR REPLACE SYNONYM CONNECT_MS_APP.dataMigrationFrom2020300To2021100_Messages FOR &SCHEMAOWNER.dataMigrationFrom2020300To2021100_Messages;
--GRANT EXECUTE ON &SCHEMAOWNER.dataMigrationFrom2020300To2021100_Messages TO &CONNECT_MS_APP;

--CREATE OR REPLACE SYNONYM CONNECT_MS_APP.dataMigrationFrom2020300To2021100_Bulk FOR &SCHEMAOWNER.dataMigrationFrom2020300To2021100_Bulk;
--GRANT EXECUTE ON &SCHEMAOWNER.dataMigrationFrom2020300To2021100_Bulk TO &CONNECT_MS_APP;

COMMIT;