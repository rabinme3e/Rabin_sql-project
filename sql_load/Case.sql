SELECT
Count(job_id) as number_of_jobs,
    CASE
        WHEN LOWER(job_location) = 'anywhere' THEN 'Remote'
        WHEN LOWER(job_location) = 'new york, ny' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE
job_title_short = 'Data Analyst'
GROUP BY
location_category;
