SELECT a.pid, COUNT(a.pid)
FROM ( SELECT mg.mid FROM moviegenre AS mg JOIN genre AS g ON mg.gid = g.id WHERE g.name = "Drama" ) AS drama_movies
	JOIN actor AS a ON a.mid = drama_movies.mid
    JOIN person AS p ON p.id = a.pid
WHERE (p.dyear IS NULL) AND (p.name LIKE "% Patel" OR p.name LIKE "% Raj") 
	AND a.pid NOT IN ( SELECT a1.pid 
 						FROM ( SELECT mg1.mid FROM moviegenre AS mg1 JOIN genre AS g1 ON mg1.gid = g1.id WHERE g1.name = "Comedy" ) AS comedy_movies
								JOIN actor AS a1 ON a1.mid = comedy_movies.mid)
	
GROUP BY a.pid
HAVING COUNT(a.pid) >= 5
    