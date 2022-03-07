SELECT m.id, m.otitle, m.runtime
FROM moviegenre AS mg JOIN movie AS m ON mg.mid = m.id JOIN genre AS g ON g.id = mg.gid
WHERE g.name = "Comedy" AND (m.year BETWEEN 1980 AND 1999) AND m.rating > 6.5 AND m.totalvotes > 10000 AND 
m.id IN ( SELECT m.id FROM moviegenre AS mg1 JOIN movie AS m1 ON mg1.mid = m1.id JOIN genre AS g1 ON g1.id = mg1.gid WHERE g1.name = "Comedy" AND m1.year <= 1999 AND m1.year > m.year AND 
m1.otitle LIKE CONCAT(m.otitle, '%') )

-- select m.id,m.otitle,m.runtime
-- from movie as m join moviegenre as mg on m.id = mg.mid
-- join genre as g on g.id = mg.gid
-- where g.name="Comedy" and m.year between 1980 and 1999 and m.rating >6.5 and m.totalvotes >10000
-- and m.id in(select m.id
-- from movie as m1 join moviegenre as mg1 on m1.id = mg1.mid
-- join genre as g1 on g1.id = mg1.gid
-- where g1.name="Comedy" and  m1.year > m.year  and m1.year<=1999 and
-- m1.otitle like concat(m.otitle,"%"));