SELECT k.pid
FROM knownfor AS k
WHERE k.pid IN ( SELECT k.pid
				FROM ( SELECT d.mid AS mid
					    FROM director AS d JOIN person AS p ON p.id = d.pid
						WHERE p.name = "Sofia Coppola" ) AS director_movies 
					JOIN knownfor AS k ON k.mid = director_movies.mid )
	AND k.pid IN ( SELECT k.pid
					FROM ( SELECT a.mid AS mid
							FROM actor AS a JOIN person as p on p.id = a.pid
							WHERE p.name = "Antonio Banderas") AS actor_movies JOIN knownfor AS k ON k.mid = actor_movies.mid )
GROUP BY k.pid