UPDATE students
SET birth_date = to_date('02/11/1998', 'DD/MM/YYYY')
WHERE first_name IN ('Lea','Marc');

UPDATE students
SET last_name = 'Guez'
WHERE first_name = 'David';

DELETE FROM students
WHERE first_name = 'Lea' 
AND last_name = 'Benichou';

SELECT COUNT(*) AS allstudentcount
FROM students;

SELECT COUNT(*) AS allstudentcount
FROM students
WHERE birth_date > to_date('01/01/2000', 'DD/MM/YYYY');

ALTER TABLE students
ADD math_grade INT;

UPDATE students
SET math_grade = 80
WHERE id = 1;

UPDATE students
SET math_grade = 90
WHERE id IN (2, 4);

Add 40 to the student which id is 6.
UPDATE students
SET math_grade = 40
WHERE id = 6;

SELECT first_name, last_name, COUNT(*) AS total_grade
FROM students
WHERE math_grade > 83
GROUP BY first_name, last_name;

INSERT INTO students (first_name, last_name, birth_date, math_grade)
VALUES ('Omer','Simpson',to_date('03/10/1980', 'DD/MM/YYYY'), 70);

-- Bonus: Count how many grades each student has.
SELECT first_name, last_name, COUNT(math_grade) AS total_grade
FROM students
GROUP BY first_name, last_name;

-- Find the sum of all the students grades.
SELECT SUM(math_grade) AS total_grade
FROM students;