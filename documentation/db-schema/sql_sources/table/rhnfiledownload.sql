-- created by Oraschemadoc Tue Jul 19 17:30:52 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNFILEDOWNLOAD" 
   (	"FILE_ID" NUMBER NOT NULL ENABLE, 
	"LOCATION" VARCHAR2(2000) NOT NULL ENABLE, 
	"TOKEN" VARCHAR2(48), 
	"REQUESTOR_IP" VARCHAR2(15) NOT NULL ENABLE, 
	"START_TIME" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"USER_ID" NUMBER, 
	 CONSTRAINT "RHN_FILEDL_FID_FK" FOREIGN KEY ("FILE_ID")
	  REFERENCES "SPACEWALK"."RHNFILE" ("ID") ENABLE, 
	 CONSTRAINT "RHN_FILEDL_UID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SPACEWALK"."WEB_CONTACT" ("ID") ON DELETE SET NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
