/*
Question: What are the top paying skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyst and helps identify
the most financially rewarding skills to acquire to improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25

/*
Here are the key insights from the skill salary data provided, broken down by technology segments:1. Big Data and Cloud Orchestration Command a Massive PremiumPySpark ($\$208,172$) is the highest-paying skill on the list by a significant margin. This highlights how critical distributed computing and large-scale data processing are for elite-tier compensation.Supporting big data infrastructure tools also secure strong six-figure averages: Databricks ($\$141,907$), Kubernetes ($\$132,500$), Airflow ($\$126,103$), and Google Cloud Platform (GCP ($\$122,500$)).2. DevOps and Collaboration Skills are the "Secret Sauce"Data professionals who possess software development and operations capabilities are earning top-tier salaries:Bitbucket ($\$189,155$) and GitLab ($\$154,500$) demonstrate that enterprise-grade version control knowledge is highly rewarded.Knowing automation and agile tracking suites like Jenkins ($\$125,436$) and Atlassian ($\$131,162$) pushes average compensation significantly above standard analyst baselines.3. Core Data Science and AI AutomationThe foundation of modern machine learning and analytics continues to yield excellent returns:Enterprise AI & Auto-ML: Managed platform skills like IBM Watson ($\$160,515$) and DataRobot ($\$155,486$) reflect high enterprise demand for automated and scalable machine learning solutions.Standard Python Stack: The staples of data analysis—Jupyter ($\$152,777$), Pandas ($\$151,821$), NumPy ($\$143,513$), and Scikit-learn ($\$125,781$)—maintain a very solid tier, cementing Python libraries as standard requirements for high earners.4. Specialized Programming LanguagesWhile Python is ubiquitous, knowing specialized or system-level languages pays off:Swift ($\$153,750$) indicates high-value niche roles surrounding mobile analytics/iOS data pipelines.Golang ($\$145,000$) and Scala ($\$124,903$) point to high-throughput backend data engineering and stream processing positions.5. Databases & Specialized Search IndexesNoSQL and Search Technology: Non-relational/distributed systems command a premium over standard SQL. Couchbase ($\$160,515$) and Elasticsearch ($\$145,000$) outperform relational standard databases like PostgreSQL ($\$123,879$), as they are typically used in complex, web-scale real-time operations.Overall Summary StatisticsMaximum Average Salary: $\$208,172$ (PySpark)Minimum Average Salary: $\$121,619$ (MicroStrategy)Median Salary Across All Skills: $\$141,907$If you are looking to maximize earning potential based on this dataset, moving beyond basic analytics into distributed data processing (PySpark) and DevOps/Engineering workflows (GitLab/Bitbucket) provides the highest financial leverage.
*/