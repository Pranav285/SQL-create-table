CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    grade VARCHAR(5),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    enrollment_date DATE,
    gpa DECIMAL(3,2)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

INSERT INTO Students (id, name, age, grade, email, phone, enrollment_date, gpa) VALUES
(1, 'Alice Johnson', 20, 'A', 'alice@example.com', '123-456-7890', '2022-09-01', 3.8),
(2, 'Bob Smith', 22, 'B', 'bob@example.com', '987-654-3210', '2021-09-01', 3.4),
(3, 'Charlie Brown', 21, 'A', 'charlie@example.com', '555-666-7777', '2023-01-15', 3.9),
(4, 'David Wilson', 23, 'C', 'david@example.com', '444-333-2222', '2020-09-01', 2.8),
(5, 'Emma Davis', 20, 'B', 'emma@example.com', '111-222-3333', '2022-06-10', 3.5);
INSERT INTO Courses (course_id, course_name, student_id) VALUES
(101, 'Math', 1),
(102, 'Science', 2),
(103, 'History', 3),
(104, 'Math', 4),
(105, 'Science', 5),
(106, 'Math', 1),
(107, 'Computer Science', 3),
(108, 'Physics', 5);
UPDATE Students 
SET gpa = 3.6
WHERE name = 'Emma Davis';
DELETE FROM Students 
WHERE name = 'David Wilson';
SELECT * FROM Students 
ORDER BY gpa DESC;
SELECT * FROM Students 
WHERE enrollment_date > '2022-01-01';
SELECT name, gpa FROM Students 
WHERE gpa > 3.5;
SELECT Students.name, Students.email, Courses.course_name 
FROM Students
JOIN Courses ON Students.id = Courses.student_id;
SELECT grade, COUNT(*) AS student_count
FROM Students
GROUP BY grade;
SELECT AVG(gpa) AS average_gpa FROM Students;
SELECT name, enrollment_date 
FROM Students 
ORDER BY enrollment_date DESC 
LIMIT 1;
SELECT course_name, COUNT(student_id) AS enrolled_students
FROM Courses
GROUP BY course_name
HAVING COUNT(student_id) > 1;
