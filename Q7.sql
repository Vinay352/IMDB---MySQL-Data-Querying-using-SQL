SELECT w.pid
FROM writer AS w JOIN person AS p1 ON w.pid = p1.id
	JOIN movie AS m1 ON w.mid = m1.id
WHERE p1.dyear IS NULL AND
	MATCH(m1.otitle) AGAINST("Jesus") AND
    MATCH(m1.otitle) AGAINST("Christ") AND
    m1.rating > ALL ( SELECT m.rating
						FROM director AS d JOIN person AS p ON d.pid = p.id
							JOIN movie AS m ON m.id = d.mid
						WHERE p.name = "Edward D. Wood Jr."
                        )