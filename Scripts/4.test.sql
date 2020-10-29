--Department
SELECT DEPTNO,DEPTNAME,FLOOR FROM DEPARTMENT;
SELECT DEPTNO,DEPTNAME,FLOOR FROM DEPARTMENT WHERE DEPTNO = 1;
INSERT INTO DEPARTMENT (DEPTNO,DEPTNAME,FLOOR)
VALUES(5, '무역', 11);
UPDATE DEPARTMENT SET DEPTNAME = '전산', FLOOR = '22' WHERE DEPTNO = 5;
DELETE FROM DEPARTMENT WHERE DEPTNO = '5';

--Employee
SELECT EMPNO,EMPNAME,TITLE,MANAGER,SALARY,DNO FROM EMPLOYEE;
SELECT EMPNO,EMPNAME,TITLE,MANAGER,SALARY,DNO FROM EMPLOYEE WHERE EMPNO = 1003;
INSERT INTO EMPLOYEE (EMPNO,EMPNAME,TITLE,MANAGER,SALARY,DNO)
VALUES('9999', '인서트', '사원', '4377', '5555555', '3');
UPDATE EMPLOYEE SET EMPNAME = 'EMP업뎃', DNO = '2' WHERE EMPNO = 9999;
DELETE FROM EMPLOYEE WHERE EMPNO = '9999';

--------------
SELECT * FROM USER_TABLES;
SELECT ADDR_ID,STREET,CITY,STATE,ZIP,COUNTRY FROM ADDRESSES;
SELECT COURSE_ID,NAME,DESCRIPTION,START_DATE,END_DATE,TUTOR_ID FROM COURSES;
SELECT COURSE_ID,STUD_ID FROM COURSE_ENROLLMENT;
SELECT STUD_ID,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID FROM STUDENTS;
SELECT TUTOR_ID,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID FROM TUTORS;

SELECT STUD_ID,NAME,EMAIL,PHONE,DOB, GENDER FROM STUDENTS WHERE STUD_ID = 1;
SELECT STUD_ID AS studId,NAME,EMAIL,PHONE,DOB FROM STUDENTS WHERE STUD_ID = 1;

SELECT STUD_ID, NAME, EMAIL, DOB,
		SUBSTR(PHONE, 1, 3) AS F,
		SUBSTR(PHONE, 5, 3) AS M,
		SUBSTR(PHONE, 9, 4) AS L
  FROM STUDENTS
 WHERE STUD_ID=1;

SELECT STUD_ID AS studId,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID FROM STUDENTS;

INSERT INTO STUDENTS(STUD_ID, NAME, EMAIL, PHONE, DOB)
VALUES(3, '홍길동3', 'lee@test.co.kr', '010-123-1234', sysdate);
UPDATE STUDENTS SET NAME = '홍길동', EMAIL = 'hong@hong.co.kr', PHONE = '010-1544-7979', DOB = SYSDATE WHERE STUD_ID = 3;
DELETE FROM STUDENTS WHERE STUD_ID = '3';

--일대일 매핑
SELECT STUD_ID, NAME, EMAIL, PHONE, DOB, A.ADDR_ID, STREET, CITY, STATE, ZIP, COUNTRY
  FROM STUDENTS S JOIN ADDRESSES A ON S.ADDR_ID=A.ADDR_ID
 WHERE STUD_ID = 1;

--일대다 매핑
SELECT T.TUTOR_ID, T.NAME AS TUTOR_NAME, EMAIL, C.COURSE_ID, C.NAME, DESCRIPTION, START_DATE, END_DATE
  FROM TUTORS T LEFT OUTER JOIN COURSES C ON T.TUTOR_ID=C.TUTOR_ID
 WHERE T.TUTOR_ID=1;

-- ENUM
SELECT STUD_ID AS studId,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID,GENDER FROM STUDENTS;
INSERT INTO STUDENTS(STUD_ID, NAME, EMAIL,PHONE, DOB, GENDER)  VALUES(5, '홍길동5', 'lee@test.co.kr', '010-123-1234', sysdate, 0);
DELETE FROM STUDENTS WHERE STUD_ID = '4';
SELECT STUD_ID AS studId,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID,GENDER FROM STUDENTS WHERE STUD_ID = 3;

--CLOB/BLOB 타입 다루기
SELECT ID, NAME, PIC, BIO FROM USER_PICS;
SELECT ID, NAME, PIC, BIO FROM USER_PICS WHERE ID = 1;
INSERT INTO USER_PICS(ID, NAME, PIC, BIO) VALUES(1, '테스트', , );
DELETE FROM USER_PICS WHERE ID = '1';

--ResultSet 처리방식의 재정의
SELECT STUD_ID AS studId,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID,GENDER FROM STUDENTS;
SELECT STUD_ID AS studId,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID,GENDER FROM STUDENTS WHERE STUD_ID = 1;


-- 매퍼 XML - 동적 SQL
SELECT COURSE_ID,NAME,DESCRIPTION,START_DATE,END_DATE,TUTOR_ID FROM COURSES;
INSERT INTO COURSES(COURSE_ID,NAME,DESCRIPTION,START_DATE,END_DATE,TUTOR_ID) VALUES(6, 'mariaDb', 'database', sysdate, sysdate, 4);
DELETE FROM COURSES WHERE COURSE_ID = 5;
UPDATE COURSES SET NAME = 'COURTEST',DESCRIPTION = 'Spring Mybatis',START_DATE = SYSDATE ,END_DATE = SYSDATE ,TUTOR_ID = '88';

SELECT  * FROM COURSES;

--TRANSACTION
SELECT TUTOR_ID,NAME,EMAIL,PHONE,DOB,BIO,PIC,ADDR_ID FROM TUTORS;
INSERT INTO TUTORS(TUTOR_ID,NAME,EMAIL,PHONE,ADDR_ID) VALUES(6, 'INSER', 'inser@gmail.com', '999-999-9999', 3);
DELETE FROM TUTORS WHERE TUTOR_ID = 6;

SELECT COURSE_ID,NAME,DESCRIPTION,START_DATE,END_DATE,TUTOR_ID FROM COURSES;
INSERT INTO COURSES(COURSE_ID,NAME,DESCRIPTION,START_DATE,END_DATE,TUTOR_ID)
VALUES(5, 'JAVA SPRING5', 'java programing into spring tool', sysdate, sysdate, 3);
DELETE FROM COURSES WHERE COURSE_ID = 5;