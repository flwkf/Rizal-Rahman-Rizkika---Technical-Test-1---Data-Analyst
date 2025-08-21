--1.Distribusi Gender User (user demographic)
SELECT gender, COUNT(*) AS total_users
FROM alert-snowfall-469510-b3.technical_test.users_data
GROUP BY gender;


--2.Statistik Usia User (user demographic)
SELECT 
    MIN(current_age) AS min_age,
    MAX(current_age) AS max_age,
    AVG(current_age) AS avg_age
FROM alert-snowfall-469510-b3.technical_test.users_data;
