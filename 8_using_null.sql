-- https://sqlzoo.net/wiki/Using_Null

-- 1
SELECT name FROM teacher WHERE dept IS NULL;

-- 2
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id);

-- 3
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

-- 4
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id);

-- 5
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;

-- 6
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON teacher.dept=dept.id;

-- 7
SELECT COUNT(id), COUNT(mobile) FROM teacher;

-- 8
SELECT dept.name, COUNT(teacher.id) FROM teacher RIGHT JOIN dept ON dept.id=teacher.dept GROUP BY dept.name;

-- 9
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' ELSE 'Art' END 'dept' FROM teacher;

-- 10
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' WHEN dept=3 THEN 'Art' ELSE 'None' END 'dept' FROM teacher;

