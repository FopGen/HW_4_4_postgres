SELECT client.NAME AS NAME, COUNT(project.ID) AS PROJECT_COUNT
FROM client
LEFT JOIN project ON client.ID = project.CLIENT_ID
GROUP BY client.NAME
HAVING COUNT(project.ID) = (
	SELECT MAX(ProjectCount)
	FROM(
		SELECT COUNT(ID) AS ProjectCount
		FROM project
		GROUP BY client_id
		)
)