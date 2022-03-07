SELECT p.pid, COUNT(p.pid)
FROM ( SELECT mg.mid FROM moviegenre AS mg JOIN genre AS g ON mg.gid = g.id WHERE g.name = "Action" ) AS action_movies
	JOIN producer AS p ON p.mid = action_movies.mid
WHERE p.pid NOT IN ( SELECT p1.pid 
 						FROM ( SELECT mg1.mid FROM moviegenre AS mg1 JOIN genre AS g1 ON mg1.gid = g1.id WHERE g1.name = "Romance" ) AS romance_movies
								JOIN producer AS p1 ON p1.mid = romance_movies.mid )
		AND p.pid IN ( SELECT d.pid
						FROM director AS d )
GROUP BY p.pid
HAVING COUNT(p.pid) >= 15
    