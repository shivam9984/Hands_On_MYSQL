-- This file contains sql command to create view, function and procedures

--Views: views are virtual table that are not defined in the schema design , can be created when you repeatedly executing a query fro several times.

CREATE TABLE courses(
    course_name VARCHAR(100) NOT NULL UNIQUE,
    course_level VARCHAR(100) NOt NULL,
    CONSTRAINT cs_level_ck CHECK(course_level="beginner" OR course_name="medium" OR course_level="advanced")

);

-- Creating view

CREATE VIEW v_course_beginner AS 
SELECT * 
FROM courses
WHERE courses.course_level =  "beginner";


CREATE TABLE company(
    company_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    contact_no INT NOT NULL,
    PRIMARY KEY(company_id)
);

CREATE TABLE complaint(
    complaint_id INT ,
    company_id INT NOT NULL,
    complaint_desc VARCHAR(200) NOT NULL,
    PRIMARY KEY(complaint_id),
    FOREIGN KEY company_id REFERENCES company(company_id)
)

-- Creating view on join of two tables

CREATE VIEW user_complaints AS 
SELECT a.company_name,
       a.owner_name,
       a.contact_no,
       count(*)
FROM company AS a
INNER JOIN complaint AS b
ON a.company_id = b.company_id
GROUP BY a.company_name,
         a.owner_name,
         a.contact_no
