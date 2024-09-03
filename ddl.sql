--Command for creating database
CREATE DATABASE circus;

CREATE DATABASE finance;

CREATE DATABASE land;

--Drop database
DROP DATABASE circus;

--Before creating any table ensure already selected the desired database in which want to create table 
USE land;

-- Create  a new table
CREATE TABLE continents(
    continent_id INT NOT NULL,
    continent_name VARCHAR(50),
    population BIGINT,
);

--Concept of constraints Primary key , not null, default,unique,check,foreign key

CREATE TABLE customers(
    customer_id INT ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(100),
    PRIMARY KEY (customer_id)
);

--Combination of more than one field can be set as primary key, which can be referred as composite key
CREATE TABLE city_temperature(
    city_name VARCHAR(100),
    year INT,
    high_temperature INT,
    PRIMARY KEY (city,year)
);

--Foreign key

CREATE TABLE complaint(
    complaint_id INT,
    customer_id INT,
    complaint VARCHAR(200),
    PRIMARY KEY (complaint_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- This reference will make sure not complaint record will not be inserted if customer_id is invalid or not exist in customer table
);

-- Cascade can be used for on update on delete operation to apply effect when modification happens in parent table

--Data Integrity :  Refers to the accuracy and consistency of data in database
--Referential Integrity : Refers to the quality of the relations between data in database tables 

--Not null and unique

CREATE TABLE contact(
    contact_id INT,
    name VARCHAR(50) NOT NULL, -- Ensuring the name field can not be empty
    city VARCHAR(50),
    phone VARCHAR(50),
    email_address VARCHAR(50) UNIQUE,
    PRIMARY KEY (contact_id)
);

-- Check for setting validation over data of any field

ALTER TABLE high_temperature 
  ADD CONSTRAINT CHECK (year between 1800 and 2200),
  ADD CONSTRAINT CHECK (high_temperature <200);

-- Default constraint

CREATE TABLE job(
    job_id INT,
    job_desc VARCHAR(100),
    shift  VARCHAR(50) DEFAULT '9-5' -- For each record the default value will be "9-5" if it is not set explicitly
    PRIMARY KEY (job_id)
)

CREATE TABLE subway_system(
    subway_name VARCHAR(100) NOT NULL UNIQUE,
    city_name VARCHAR(50) NOT NULL ,
    country_code CHAR(2),
    FOREIGN
);

CREATE TABLE country(
    country_code CHAR(2) UNIQUE,
    country_name VARCHAR(50) NOT NULL,
);

-- Alter table command

ALTER TABLE country
ADD COLUMN continent_name VARCHAR(50) UNIQUE;

ALTER TABLE country
MODIFY COLUMN country_name UNIQUE;

ALTER TABLE country
DROP COLUMN continent_name ;

ALTER TABLE country
CHANGE COLUMN country_code country_two_digit_code CHAR(2); -- Renaming existing column


CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT
)

-- Functions : Refers to same function that we write in programming languages, here we wrap complex query withing a function and execute it by calling the function









