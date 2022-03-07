SELECT d.pid, COUNT(d.pid), ROUND(AVG(m.rating), 2) AS average 
FROM ( SELECT mg.mid FROM moviegenre AS mg JOIN genre AS g ON mg.gid = g.id WHERE g.name = "Sci-Fi" ) AS sci_fi_movies
	JOIN director AS d ON d.mid = sci_fi_movies.mid
	JOIN movie AS m ON m.id = d.mid
WHERE m.totalvotes >= 1000
GROUP BY d.pid
HAVING COUNT(d.pid) >= 5
ORDER BY average
LIMIT 15