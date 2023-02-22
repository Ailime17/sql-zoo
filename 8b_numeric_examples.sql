-- https://sqlzoo.net/wiki/NSS_Tutorial

-- 1
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
AND institution='Edinburgh Napier University'
AND subject='(8) Computer Science';

-- 2
SELECT institution, subject
FROM nss
WHERE question='Q15'
AND score >= 100;

-- 3
SELECT institution,score
FROM nss
WHERE question='Q15'
AND score < 50
AND subject='(8) Computer Science';

-- 4
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design') GROUP BY subject;

-- 5
SELECT subject, SUM((A_STRONGLY_AGREE*response)/100)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design') GROUP BY subject;

-- 6
SELECT subject,
ROUND(
SUM((A_STRONGLY_AGREE * response) / 100) / 
SUM(response) * 100) AS STRONGLY_AGREE
FROM nss
WHERE question='Q22'
AND subject IN('(8) Computer Science', '(H) Creative Arts and Design') GROUP BY subject;

-- 7
SELECT institution,
ROUND(SUM((score * response) / 100) / SUM(response) * 100)
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution;

-- 8
SELECT institution,SUM(sample), (SELECT SUM(sample)
FROM nss AS ny
WHERE
question = 'Q01' AND subject = '(8) Computer Science'
AND ny.institution = nss.institution) AS computer_science_students
FROM nss
WHERE question='Q01'
AND (institution LIKE '%Manchester%') GROUP BY institution;

