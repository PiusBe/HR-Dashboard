CREATE DATABASE projects;

USE projects;
SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(50);

DESCRIBE hr;
SELECT birthdate FROM hr;


SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
SELECT birthdate FROM hr;
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;



SELECT hire_date FROM hr;
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
SELECT hire_date FROM hr;


UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NULL AND termdate != '';


ALTER TABLE hr
MODIFY COLUMN termdate DATE;
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;



ALTER TABLE hr
ADD COLUMN AGE int;
UPDATE hr
SET Age = timestampdiff(YEAR, birthdate, CURDATE());
SELECT birthdate, age FROM hr;


SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;
SELECT count(*) FROM hr WHERE age < 18;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;
SELECT termdate from hr;
SET sql_mode = 'ALLOW_INVALID_DATES';
ALTER TABLE hr
MODIFY COLUMN termdate DATE;
describe HR;

