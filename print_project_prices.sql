SELECT project_id AS name, SUM(worker.salary) * 
					(SELECT ((DATE_PART('year', finish_date::date)-DATE_PART('year', start_date::date))*12 +	
							DATE_PART('month', finish_date::date)-DATE_PART('month', start_date::date)) 
					FROM project
		   			WHERE project.id = project_id) AS PRICE
 					
FROM project_worker
LEFT JOIN worker ON project_worker.worker_id = worker.id
GROUP BY project_id
ORDER BY price DESC