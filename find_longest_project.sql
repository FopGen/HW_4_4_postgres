SELECT id, (DATE_PART('year', finish_date::date)-DATE_PART('year', start_date::date))*12 +
	DATE_PART('month', finish_date::date)-DATE_PART('month', start_date::date) AS MONTH_COUNT
FROM project
GROUP BY project.id

HAVING MAX((DATE_PART('year', finish_date::date)-DATE_PART('year', start_date::date))*12 +
	DATE_PART('month', finish_date::date)-DATE_PART('month', start_date::date)) = (
	SELECT MAX(quintMonth)
	FROM(
		SELECT MAX ((DATE_PART('year', finish_date::date)-DATE_PART('year', start_date::date))*12 +
	DATE_PART('month', finish_date::date)-DATE_PART('month', start_date::date)) AS quintMonth
		FROM project
		GROUP BY client_id
		)
)