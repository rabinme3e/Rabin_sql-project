SELECT
job_id,
job_title_short,
salary_year_avg,
CASE
WHEN salary_year_avg  >=100000 THEN 'high Salary'
when salary_year_avg  >= 70000 THEN 'Standard Salary'
ELSE 'Low Salary'
END AS "salary bucket"
FROM 
job_postings_fact
WHERE
 job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
ORDER BY
salary_year_avg ASC;
