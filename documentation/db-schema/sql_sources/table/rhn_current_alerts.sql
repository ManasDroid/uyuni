-- created by Oraschemadoc Tue Jul 19 17:31:05 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_CURRENT_ALERTS" 
   (	"RECID" NUMBER(12,0) NOT NULL ENABLE, 
	"DATE_SUBMITTED" DATE, 
	"LAST_SERVER_CHANGE" DATE, 
	"DATE_COMPLETED" DATE DEFAULT (to_date('31-12-9999', 'dd-mm-yyyy')), 
	"ORIGINAL_SERVER" NUMBER(12,0), 
	"CURRENT_SERVER" NUMBER(12,0), 
	"TEL_ARGS" VARCHAR2(2200), 
	"MESSAGE" VARCHAR2(2000), 
	"TICKET_ID" VARCHAR2(80), 
	"DESTINATION_NAME" VARCHAR2(50), 
	"ESCALATION_LEVEL" NUMBER(2,0) DEFAULT (0), 
	"HOST_PROBE_ID" NUMBER(12,0), 
	"HOST_STATE" VARCHAR2(255), 
	"SERVICE_PROBE_ID" NUMBER(12,0), 
	"SERVICE_STATE" VARCHAR2(255), 
	"CUSTOMER_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"NETSAINT_ID" NUMBER(12,0), 
	"PROBE_TYPE" VARCHAR2(20) DEFAULT ('none'), 
	"IN_PROGRESS" CHAR(1) DEFAULT (1) NOT NULL ENABLE, 
	"LAST_UPDATE_DATE" DATE, 
	"EVENT_TIMESTAMP" DATE, 
	 CONSTRAINT "RHN_ALRTS_RECID_PK" PRIMARY KEY ("RECID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
