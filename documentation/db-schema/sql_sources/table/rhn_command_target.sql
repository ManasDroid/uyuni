-- created by Oraschemadoc Tue Jul 19 17:31:05 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_COMMAND_TARGET" 
   (	"RECID" NUMBER NOT NULL ENABLE, 
	"TARGET_TYPE" VARCHAR2(10) NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER(12,0) NOT NULL ENABLE, 
	 CONSTRAINT "CMDTG_TARGET_TYPE_CK" CHECK (target_type in ('cluster','node')) ENABLE, 
	 CONSTRAINT "RHN_CMDTG_RECID_TARGET_TYPE_PK" PRIMARY KEY ("RECID", "TARGET_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_CMDTG_CSTMR_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "SPACEWALK"."WEB_CUSTOMER" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
