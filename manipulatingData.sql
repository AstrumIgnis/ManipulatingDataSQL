set echo on
set verify on
set pagesize 66
set linesize 132
spool c:/cprg250s/manipulatingDataOutput.txt
DELETE FROM GHC_EXPERTISE;
DELETE FROM GHC_COURSE;
DELETE FROM GHC_FACULTY;
DELETE FROM GHC_DEPARTMENT;
rem 
rem Insert values into GHC_DEPARTMENT
rem
INSERT INTO GHC_DEPARTMENT
VALUES (200, 'Computer Science');
INSERT INTO GHC_DEPARTMENT
VALUES (300, 'Mathematics');
rem
rem Insert values into GHC_FACULTY
rem 
INSERT INTO GHC_FACULTY
VALUES (1001, 'Gosling', 'James', '01-Jan-22', NULL, 1, 200);
INSERT INTO GHC_FACULTY
VALUES (1002, 'Hajit', 'Mohammed', '01-Jan-24', NULL, 1, 200);
rem
rem Insert values into GHC_COURSE
rem 
INSERT INTO GHC_COURSE
VALUES ('CPSC201', 'Introduction to Programming', 2);
INSERT INTO GHC_COURSE
VALUES ('CPSC302', 'OOP', 5);
INSERT INTO GHC_COURSE
VALUES ('CPSC304', 'Algorithrms', 5);
INSERT INTO GHC_COURSE
VALUES ('CPSC402', 'OOP II', 5);
rem
rem Insert values into GHC_EXPERTISE
rem
INSERT INTO GHC_EXPERTISE
VALUES (1001, 'CPSC201');
INSERT INTO GHC_EXPERTISE
VALUES (1001, 'CPSC302');
INSERT INTO GHC_EXPERTISE
VALUES (1001, 'CPSC304');
INSERT INTO GHC_EXPERTISE
VALUES (1002, 'CPSC201');
INSERT INTO GHC_EXPERTISE
VALUES (1002, 'CPSC302');
INSERT INTO GHC_EXPERTISE
VALUES (1002, 'CPSC304');
INSERT INTO GHC_EXPERTISE
VALUES (1002, 'CPSC402');

select surname, dept_name, date_hired, course_code
from ghc_course natural join ghc_expertise natural join
     ghc_faculty natural join ghc_department
order by 1,4;

UPDATE GHC_COURSE
    SET COURSE_TITLE = 'Object Oriented Programming'
    WHERE COURSE_CODE = 'CPSC302';

DELETE FROM GHC_EXPERTISE 
    WHERE COURSE_CODE = 'CPSC304';
DELETE FROM GHC_COURSE 
    WHERE COURSE_CODE = 'CPSC304';

select course_code, course_title, faculty_id
from ghc_course natural join ghc_expertise 
    natural join ghc_faculty
order by 1,2;


commit;

spool off