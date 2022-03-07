SELECT k.pid, COUNT(k.mid), ROUND(AVG(m.rating), 2) AS average
FROM moviegenre AS mg JOIN genre AS g ON g.id = mg.gid
	JOIN knownfor AS k ON k.mid = mg.mid
    JOIN person AS p ON p.id = k.pid
    JOIN director AS d ON d.mid = mg.mid
	JOIN movie AS m ON mg.mid = m.id
WHERE p.dyear IS NULL AND MATCH(p.name) AGAINST("Steve%") 
	AND ( g.name = "Drama" OR g.name = "Thriller" )
GROUP BY k.pid
HAVING COUNT(k.mid) = 4 AND COUNT(DISTINCT(d.pid))
ORDER BY average DESC -- secondary ordering : figure out which one