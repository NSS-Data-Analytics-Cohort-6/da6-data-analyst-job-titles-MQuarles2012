/*
SELECT count(*) 
FROM data_analyst_jobs;

SELECT *
FROM data_analyst_jobs
LIMIT 10;

SELECT COUNT(location)			
FROM data_analyst_jobs	
WHERE location = 'TN';

SELECT count(location)			
FROM data_analyst_jobs	
WHERE location = 'TN' AND star_rating > 4;

SELECT count(review_count)			
FROM data_analyst_jobs	
WHERE review_count BETWEEN 500 AND 1000;

SELECT DISTINCT location AS state, 
	ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

SELECT count(sub.company) FROM (SELECT company, AVG(star_rating)
FROM data_analyst_jobs
GROUP BY company) AS sub;

*/


