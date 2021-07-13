## Introduction:

This is a one time execution to migrate the table(MS_MSG_EVNT) to 2021.2.0 version of Message Store. 

### Prerequisite: 

Please run this in conjunction with databsae.md, which details out the schema you are migrating from and provides centralized steps. 

## Script:

### step 01
Run the scripts as database task for table migration. 

| Name | Type | Description |
|---|---|---|
01_ms_msg_event_taskId_datatype_change.sql | Scripts | Run script to change datatype for COLUMN 'TASK_ID' of table 'MS_MSG_EVNT'.
02_sp_ms_get_events | Stored Procedure |  Rerun this procedure from ..\..\..\\schema_creation|
03_sp_ms_get_message_by_id | Stored Procedure |  Rerun this procedure from ..\..\..\\schema_creation |
04_sp_ms_post_events | Stored Procedure |  Rerun this procedure from ..\..\..\\schema_creation |
05_sp_ms_post_message | Stored Procedure |  Rerun this procedure from ..\..\..\\schema_creation |

**Note** To run these, Please make sure you enable the script execution in your tooling.

| Tool Name | How to enable| 
|---|---|
| **Oracle SQL Developer** | Got to **File -> new **  and execute the scripts|

