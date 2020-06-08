--------------------------------------------------------
--  ������ ������ - �ݿ���-5��-22-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMBER
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_MEMBER"  MINVALUE 1 MAXVALUE 9000 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
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
REM INSERTING into HR.MEMBER
SET DEFINE OFF;
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (1,'medici','�޵�ġ','1234','medici@test1.net','010-1111-1111',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,1);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (2,'compose','������','1234','compose@test2.net','010-1111-1112',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,2);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (3,'dutchbean','��ġ��','1234','dutchbean@test3.net','010-1111-1113',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,3);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (4,'bodykey','�ٵ�Ű','1234','bodykey@test4.net','010-1111-1114',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,4);
Insert into HR.MEMBER (USERNUM,USERID,NAME,PASSWORD,EMAIL,PHONE,DELETECOUNT,BIRTH,INSERTDAY,DELETEDAY,USERCOMMENT,CUST_MANAGER_ID) values (9999,'admin','������','admin','admin@admin.net','010-1111-1111',0,to_date('20/05/22','RR/MM/DD'),to_date('20/05/22','RR/MM/DD'),null,null,5);
REM INSERTING into HR.CUST_MANAGER
SET DEFINE OFF;
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22401);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22402);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22403);
Insert into HR.CUST_MANAGER (CUST_MANAGER_ID,CUST_ID) values (5,22404);
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PK_MEMBER" ON "HR"."MEMBER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007635
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007635" ON "HR"."MEMBER" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007636
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007636" ON "HR"."MEMBER" ("CUST_MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007628
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007628" ON "HR"."CUST_MANAGER" ("CUST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
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
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER" ADD UNIQUE ("CUST_MANAGER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBER" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBER" MODIFY ("BIRTH" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CUST_MANAGER
--------------------------------------------------------

  ALTER TABLE "HR"."CUST_MANAGER" ADD UNIQUE ("CUST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."CUST_MANAGER" MODIFY ("CUST_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."CUST_MANAGER" MODIFY ("CUST_MANAGER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  ������ ������ - ������-6��-08-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "HR"."BOARD" 
   (	"BOARD_ID" NUMBER, 
	"CATEGORY_ID" NUMBER, 
	"WRITER" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(500 BYTE), 
	"CONTENT" CLOB, 
	"WRITE_DATE" DATE DEFAULT SYSDATE, 
	"MASTER_ID" NUMBER, 
	"REPLY_NUMBER" NUMBER, 
	"REPLY_STEP" NUMBER, 
	"READ_COUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table BOARD_CATEGORY
--------------------------------------------------------

  CREATE TABLE "HR"."BOARD_CATEGORY" 
   (	"CATEGORY_ID" NUMBER, 
	"CATEGORY_NAME" VARCHAR2(100 BYTE), 
	"CATEGORY_CLASS1" NUMBER(4,0), 
	"CATEGORY_CLASS2" NUMBER(4,0), 
	"CATEGORY_DESCRIPTION" VARCHAR2(100 BYTE), 
	"CATEGORY_ORDER" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  CREATE TABLE "HR"."BOARD_UPLOAD_FILE" 
   (	"FILE_ID" NUMBER, 
	"BOARD_ID" NUMBER, 
	"FILE_NAME" VARCHAR2(235 BYTE), 
	"FILE_SIZE" VARCHAR2(45 BYTE), 
	"FILE_CONTENT_TYPE" VARCHAR2(500 BYTE), 
	"FILE_DATA" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("FILE_DATA") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into HR.BOARD
SET DEFINE OFF;
Insert into HR.BOARD (BOARD_ID,CATEGORY_ID,WRITER,EMAIL,PASSWORD,TITLE,WRITE_DATE,MASTER_ID,REPLY_NUMBER,REPLY_STEP,READ_COUNT) values (7,8,'�̵��','silent10z@naver.com','sdsd','[Re]1',to_date('20/03/27','RR/MM/DD'),2,3,1,3);
Insert into HR.BOARD (BOARD_ID,CATEGORY_ID,WRITER,EMAIL,PASSWORD,TITLE,WRITE_DATE,MASTER_ID,REPLY_NUMBER,REPLY_STEP,READ_COUNT) values (9,9,'�̵��','silent10z@naver.com','1111','teststest',to_date('20/05/04','RR/MM/DD'),9,0,0,6);
Insert into HR.BOARD (BOARD_ID,CATEGORY_ID,WRITER,EMAIL,PASSWORD,TITLE,WRITE_DATE,MASTER_ID,REPLY_NUMBER,REPLY_STEP,READ_COUNT) values (16,8,'������','admin@admin.net','123','123',to_date('20/04/04','RR/MM/DD'),16,0,0,2);
Insert into HR.BOARD (BOARD_ID,CATEGORY_ID,WRITER,EMAIL,PASSWORD,TITLE,WRITE_DATE,MASTER_ID,REPLY_NUMBER,REPLY_STEP,READ_COUNT) values (4,8,'�̵��','silent10z@naver.com','123','test �ڷ��',to_date('20/03/20','RR/MM/DD'),4,0,0,1);
Insert into HR.BOARD (BOARD_ID,CATEGORY_ID,WRITER,EMAIL,PASSWORD,TITLE,WRITE_DATE,MASTER_ID,REPLY_NUMBER,REPLY_STEP,READ_COUNT) values (5,9,'�̵��','silent10z@naver.com','123','111',to_date('20/03/20','RR/MM/DD'),5,0,0,2);
REM INSERTING into HR.BOARD_CATEGORY
SET DEFINE OFF;
Insert into HR.BOARD_CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_CLASS1,CATEGORY_CLASS2,CATEGORY_DESCRIPTION,CATEGORY_ORDER) values (7,'�Խ���',1,10,'�Խ���',100);
Insert into HR.BOARD_CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_CLASS1,CATEGORY_CLASS2,CATEGORY_DESCRIPTION,CATEGORY_ORDER) values (8,'�ڷ��',1,10,'�ڷ��',200);
Insert into HR.BOARD_CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_CLASS1,CATEGORY_CLASS2,CATEGORY_DESCRIPTION,CATEGORY_ORDER) values (9,'�ַ���',1,10,'�ַ���',300);
REM INSERTING into HR.BOARD_UPLOAD_FILE
SET DEFINE OFF;
Insert into HR.BOARD_UPLOAD_FILE (FILE_ID,BOARD_ID,FILE_NAME,FILE_SIZE,FILE_CONTENT_TYPE) values (0,7,'test1.jpg','3830','image/jpeg');
Insert into HR.BOARD_UPLOAD_FILE (FILE_ID,BOARD_ID,FILE_NAME,FILE_SIZE,FILE_CONTENT_TYPE) values (4,9,'ALMind_Lite_172.exe','17182088','application/x-msdownload');
Insert into HR.BOARD_UPLOAD_FILE (FILE_ID,BOARD_ID,FILE_NAME,FILE_SIZE,FILE_CONTENT_TYPE) values (1,4,'test1.jpg','3830','image/jpeg');
Insert into HR.BOARD_UPLOAD_FILE (FILE_ID,BOARD_ID,FILE_NAME,FILE_SIZE,FILE_CONTENT_TYPE) values (2,5,'test1.jpg','3830','image/jpeg');
Insert into HR.BOARD_UPLOAD_FILE (FILE_ID,BOARD_ID,FILE_NAME,FILE_SIZE,FILE_CONTENT_TYPE) values (3,4,'test1.jpg','3830','image/jpeg');
--------------------------------------------------------
--  DDL for Index PK_BOARD_BOARD_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PK_BOARD_BOARD_ID" ON "HR"."BOARD" ("BOARD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_CATEGORY_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PK_BOARD_CATEGORY_ID" ON "HR"."BOARD_CATEGORY" ("CATEGORY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UK_BOARD_CATEGORY_NAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."UK_BOARD_CATEGORY_NAME" ON "HR"."BOARD_CATEGORY" ("CATEGORY_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_FILE_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."PK_BOARD_FILE_ID" ON "HR"."BOARD_UPLOAD_FILE" ("FILE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD" ADD CONSTRAINT "PK_BOARD_BOARD_ID" PRIMARY KEY ("BOARD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."BOARD" MODIFY ("WRITE_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_CATEGORY
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD_CATEGORY" ADD CONSTRAINT "UK_BOARD_CATEGORY_NAME" UNIQUE ("CATEGORY_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."BOARD_CATEGORY" ADD CONSTRAINT "PK_BOARD_CATEGORY_ID" PRIMARY KEY ("CATEGORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."BOARD_CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD_UPLOAD_FILE" ADD CONSTRAINT "PK_BOARD_FILE_ID" PRIMARY KEY ("FILE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD" ADD CONSTRAINT "FK_BOARD_CATEGORY_ID" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "HR"."BOARD_CATEGORY" ("CATEGORY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD_UPLOAD_FILE" ADD CONSTRAINT "FK_BOARD_BOARD_ID" FOREIGN KEY ("BOARD_ID")
	  REFERENCES "HR"."BOARD" ("BOARD_ID") ENABLE;