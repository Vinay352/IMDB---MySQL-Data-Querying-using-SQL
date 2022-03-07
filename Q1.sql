SELECT a.pid, COUNT(a.pid)
FROM person AS p
JOIN actor AS a ON a.pid = p.id
JOIN movie AS m ON m.id = a.mid 
WHERE year = 2016 AND dyear IS NULL AND runtime > 90 AND a.pid NOT IN (SELECT a1.pid FROM actor AS a1 JOIN movie AS m1 ON a1.mid = m1.id WHERE m1.year > 2016)
GROUP BY a.pid
HAVING COUNT(a.pid) > 3
ORDER BY COUNT(a.pid) DESC