/*
Question: What are the most optimal skills to learn (aka it's high demand and high paying skills)?
- identify skills that are both in high demand (frequently listed in job postings) and associated with higher salaries for Data Analyst positions
- Focuses on remote positions with specified salaries
- Why? It helps prioritize skill development efforts by highlighting which skills are not only sought
after by employers but also financially rewarding, guiding professionals towards the most impactful 
areas for career growth.    
*/


SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    -- AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,  -- move demand_count to be first in the ORDER BY
    avg_salary DESC 
LIMIT 25; 