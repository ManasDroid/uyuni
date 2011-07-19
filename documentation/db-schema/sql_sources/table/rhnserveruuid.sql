-- created by Oraschemadoc Tue Jul 19 17:31:00 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNSERVERUUID" 
   (	"SERVER_ID" NUMBER NOT NULL ENABLE, 
	"UUID" VARCHAR2(36) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_SERVER_UUID_SID_FK" FOREIGN KEY ("SERVER_ID")
	  REFERENCES "SPACEWALK"."RHNSERVER" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
