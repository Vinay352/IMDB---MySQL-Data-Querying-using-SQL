SELECT a.pid, COUNT(a.pid)
FROM movie AS m JOIN actor AS a ON m.id = a.mid
WHERE adult = 1 AND year = 2021 AND a.pid NOT IN ( SELECT a1.pid FROM movie AS m1 JOIN actor AS a1 ON m1.id = a1.mid WHERE adult = 1 AND year < 2021 )
GROUP BY a.pid
ORDER BY COUNT(a.pid) DESC, a.pid ASC
LIMIT 25