--------------------------------------------------------
--  파일이 생성됨 - 수요일-5월-27-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMBER
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_MEMBER"  MINVALUE 1 MAXVALUE 9000 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CUST_MANAGER
--------------------------------------------------------

  CREATE TABLE "HR"."CUST_MANAGER" 
   (	"CUST_MANAGER_ID" NUMBER(*,0), 
	"CUST_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBER" 
   (	"USERNUM" NUMBER, 
	"USERID" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	"DELETECOUNT" NUMBER DEFAULT 0, 
	"BIRTH" DATE, 
	"INSERTDAY" DATE DEFAULT SYSDATE, 
	"DELETEDAY" DATE, 
	"USERCOMMENT" VARCHAR2(500 BYTE), 
	"CUST_MANAGER_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY
;
REM INSERTING into HR.CUST_MANAGER
SET DEFINE OFF;
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22401);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22402);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22403);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22404);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22405);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22406);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22407);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22408);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22409);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22410);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22411);
REM INSERTING into HR.MEMBER
SET DEFINE OFF;
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (1,'medici','메디치','1234','medici@test1.net','010-1111-1111',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,1);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (2,'compose','컴포즈','1234','compose@test2.net','010-1111-1112',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,2);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (3,'dutchbean','더치빈','1234','dutchbean@test3.net','010-1111-1113',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,3);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (4,'bodykey','바디키','1234','bodykey@test4.net','010-1111-1114',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,4);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (9999,'admin','관리자','admin','admin@admin.net','010-1111-1111',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,5);
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PK_MEMBER" ON "HR"."MEMBER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007628
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007628" ON "HR"."CUST_MANAGER" ("CUST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007635
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007635" ON "HR"."MEMBER" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007636
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007636" ON "HR"."MEMBER" ("CUST_MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  Constraints for Table CUST_MANAGER
--------------------------------------------------------

  ALTER TABLE "HR"."CUST_MANAGER" ADD UNIQUE ("CUST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."CUST_MANAGER" MODIFY ("CUST_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."CUST_MANAGER" MODIFY ("CUST_MANAGER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER" ADD UNIQUE ("CUST_MANAGER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBER" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBER" MODIFY ("BIRTH" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
