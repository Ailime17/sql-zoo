-- https://sqlzoo.net/wiki/Window_functions

-- 1
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;


-- 2
SELECT party, votes,
RANK() OVER (ORDER BY votes DESC) AS position
FROM ge
WHERE constituency = 'S14000024'
AND yr = 2017
ORDER BY party;

-- 3
SELECT yr,party, votes,
RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party,yr;

-- 4
SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE yr  = 2017 AND constituency BETWEEN 'S14000021' AND 'S14000026'
ORDER BY posn, constituency;

--5
SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE yr  = 2017 AND constituency BETWEEN 'S14000021' AND 'S14000026' AND votes >= ALL(
SELECT votes
FROM ge AS gege
WHERE yr  = 2017 AND gege.constituency = ge.constituency
)
ORDER BY posn, constituency;