SELECT
    job_id,
    job_title,
    job_location,
    job_posted_date,
    salary_year_avg,
    job_schedule_type,
    name AS company_name
    FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id= company_dim.company_id
    WHERE
    job_title_short = 'Data Analyst' 
    AND
    job_location = 'Anywhere'
    AND
    job_schedule_type = 'Full-time'
    AND 
    salary_year_avg is not null
    ORDER BY  salary_year_avg DESC
    LIMIT
     10;
