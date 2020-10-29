-- 부서
CREATE TABLE "DEPARTMENT" (
      "DEPTNO" NUMBER NOT NULL,
      "DEPTNAME" VARCHAR2(50) NOT NULL,
      "FLOOR" NUMBER NULL
);

-- 부서
ALTER TABLE "DEPARTMENT"
   ADD CONSTRAINT "PK_DEPARTMENT" -- 부서 기본키
   PRIMARY KEY (
      "DEPTNO" -- 부서번호
   );

-- 사원
CREATE TABLE "EMPLOYEE" (
      "EMPNO" NUMBER NOT NULL,
      "EMPNAME" VARCHAR2(50) NOT NULL,
      "TITLE" VARCHAR2(50) NULL,
      "MANAGER" NUMBER NULL,
      "SALARY" NUMBER NULL,
      "DNO" NUMBER NULL
);

-- 사원
ALTER TABLE "EMPLOYEE"
   ADD CONSTRAINT "PK_EMPLOYEE" -- 사원 기본키
   PRIMARY KEY (
      "EMPNO" -- 사원번호
   );

-- 사원
ALTER TABLE "EMPLOYEE"
   ADD CONSTRAINT "FK_EMPLOYEE_TO_EMPLOYEE" -- 사원 -> 사원
   FOREIGN KEY (
      "MANAGER" -- 직속상사
   )
   REFERENCES "EMPLOYEE" ( -- 사원
      "EMPNO" -- 사원번호
   );

-- 사원
ALTER TABLE "EMPLOYEE"
   ADD CONSTRAINT "FK_DEPARTMENT_TO_EMPLOYEE" -- 부서 -> 사원
   FOREIGN KEY (
      "DNO" -- 부서
   )
   REFERENCES "DEPARTMENT" ( -- 부서
      "DEPTNO" -- 부서번호
   );