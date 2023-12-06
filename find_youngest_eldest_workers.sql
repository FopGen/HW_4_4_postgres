SELECT 'ELDEST' AS TYPE, name, birthday
FROM worker
GROUP BY name, birthday
HAVING DATE_PART('year', age(birthday::date)) IN (		
	SELECT DATE_PART('year', age(birthday::date)) AS age
	FROM worker
	GROUP BY age
	ORDER BY age DESC
	LIMIT 1	
	)
	
UNION

SELECT 'YOUNGEST', name, birthday
FROM worker
GROUP BY name, birthday
HAVING DATE_PART('year', age(birthday::date)) IN (		
	SELECT DATE_PART('year', age(birthday::date)) AS age
	FROM worker
	GROUP BY age
	ORDER BY age ASC
	LIMIT 1	
	)