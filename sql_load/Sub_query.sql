SELECT
c.name AS company_name,
job_counts.total_postings,
CASE
WHEN job_counts.total_postings <10 THEN 'Small'
WHEN job_counts.total_postings Between 10 and 50 THEN 'Medium'
when job_counts.total_postings > 50 then 'Large'
END as company_size_together
FROM(
    SELECT
    company_id,
    Count (job_id) as total_postings
    FROM 
    job_postings_fact
    GROUP BY company_id
) AS job_counts
JOIN company_dim AS c ON job_counts.company_id=c.company_id
ORDER BY
total_postings DESC;