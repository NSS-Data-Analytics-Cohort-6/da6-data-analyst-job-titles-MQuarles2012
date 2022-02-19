/*
SELECT count(*) 											1	--How many rows are in the data_analyst_jobs table?
FROM data_analyst_jobs;											--answer: 1793

SELECT *													2	--What company is associated with the job posting on the 10th row?
FROM data_analyst_jobs											--answer: "ExxonMobil"
LIMIT 10;

SELECT COUNT(location)										3a	--How many postings are in Tennessee? 
FROM data_analyst_jobs											--answer: 21
WHERE location = 'TN';

SELECT count(location)										3b	--How many are there in either Tennessee or Kentucky?	
FROM data_analyst_jobs											--answer: 27
WHERE location = 'TN' OR location = 'KY';

SELECT count(location)										4	--How many postings in Tennessee have a star rating above 4?
FROM data_analyst_jobs											--answer: 3
WHERE location = 'TN' AND star_rating > 4;

SELECT count(review_count)									5	--How many postings in the dataset have a review count between 500 and 1000?
FROM data_analyst_jobs											--answer: 151
WHERE review_count BETWEEN 500 AND 1000;

SELECT DISTINCT location AS state, 							6	--Which state shows the highest average star rating?
	ROUND(AVG(star_rating), 2) AS avg_rating					--answer: NE has highest ranked star_rating (but three states have null values: SD, VT, and WY)
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

SELECT COUNT(DISTINCT title)								7	--Select unique job titles from the data_analyst_jobs table. How many are there?
FROM data_analyst_jobs;											--answer: 881

SELECT COUNT(DISTINCT title)								8	--How many unique job titles are there for California companies?
FROM data_analyst_jobs											--answer: 230
WHERE location = 'CA';	

SELECT count(company) 										9	--How many companies are there with more that 5000 reviews across all locations? 			
FROM (SELECT company, AVG(star_rating)							--answer: 40 (39 if you don't count the null value)			
FROM data_analyst_jobs
	  WHERE review_count > 5000
GROUP BY company) AS sub;

SELECT company, AVG(star_rating)							10	--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
	FROM data_analyst_jobs										--answer: there are six companies tied for highest rating, which is 4.1999998090000000.  
	  WHERE review_count > 5000									--			The tied companies are General Motors, Unilever, Microsoft, Nike, American Express, and Kaiser Permanente
GROUP BY company
ORDER BY avg DESC

SELECT COUNT(DISTINCT title) 								11	--Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
FROM data_analyst_jobs											--answer: 754 unique job titles, 1636 if not unique
WHERE title LIKE '%Analyst%';

SELECT DISTINCT title										12	--How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
FROM data_analyst_jobs											--What word do these positions have in common?
WHERE title NOT LIKE '%Analyst%' 								--answer: 26 roles, their titles still have analyst in them but it is uppercase
AND title NOT LIKE '%Analytics%';								--	 		indicating the SQL search is case sensitive

SELECT COUNT(domain)										B-a	--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
FROM data_analyst_jobs											--answer: 403
WHERE skill LIKE '%SQL%' 
AND days_since_posting > 21 
AND domain IS NOT NULL

SELECT domain, COUNT(domain) AS counts						B-b	--Which three industries are in the top 4 on this list?
	FROM data_analyst_jobs										--answer: Internet and Software (62), Banks and Financial Services (61), and Consulting and Business Services (57), Health Care (52)
		WHERE skill LIKE '%SQL%' 							B-c --How many jobs have been listed for more than 3 weeks for each of the top 4?
			AND days_since_posting > 21 						--answer: 232
			AND domain IS NOT NULL
GROUP BY domain
ORDER BY counts DESC;

*/
