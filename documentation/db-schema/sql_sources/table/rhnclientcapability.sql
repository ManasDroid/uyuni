-- created by Oraschemadoc Tue Jul 19 17:30:49 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNCLIENTCAPABILITY" 
   (	"SERVER_ID" NUMBER NOT NULL ENABLE, 
	"CAPABILITY_NAME_ID" NUMBER NOT NULL ENABLE, 
	"VERSION" VARCHAR2(32) NOT NULL ENABLE, 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_CLIENTCAP_SID_FK" FOREIGN KEY ("SERVER_ID")
	  REFERENCES "SPACEWALK"."RHNSERVER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CLIENTCAP_CAP_NID_FK" FOREIGN KEY ("CAPABILITY_NAME_ID")
	  REFERENCES "SPACEWALK"."RHNCLIENTCAPABILITYNAME" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
