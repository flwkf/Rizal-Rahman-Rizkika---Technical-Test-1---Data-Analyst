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

-- Distribusi umur per kelompok (age group) dan gender
WITH base AS (
  SELECT
    gender,
    current_age
  FROM alert-snowfall-469510-b3.technical_test.users_data
  WHERE current_age IS NOT NULL
)
SELECT
  gender,
  CASE 
    WHEN current_age BETWEEN 18 AND 25 THEN '18-25'
    WHEN current_age BETWEEN 26 AND 35 THEN '26-35'
    WHEN current_age BETWEEN 36 AND 50 THEN '36-50'
    WHEN current_age BETWEEN 51 AND 65 THEN '51-65'
    ELSE '65+' 
  END AS age_group,
  COUNT(*) AS total_users
FROM base
GROUP BY gender, age_group
ORDER BY age_group, gender;

-- Rata-rata usia nasabah baru per tahun
WITH base AS (
  SELECT
    EXTRACT(YEAR FROM MIN(DATE(t.date))) AS first_year,
    (EXTRACT(YEAR FROM MIN(DATE(t.date))) - u.birth_year) AS age_at_first_txn,
    COUNT(DISTINCT t.client_id) AS total_users
  FROM alert-snowfall-469510-b3.technical_test.transactions_data t
  JOIN alert-snowfall-469510-b3.technical_test.users_data u
    ON t.client_id = u.id
  WHERE t.date IS NOT NULL AND u.birth_year IS NOT NULL
  GROUP BY u.id, u.birth_year
)
SELECT
  first_year,
  SUM(age_at_first_txn * total_users) / SUM(total_users) AS avg_age_new_users,
  SUM(total_users) AS total_new_users
FROM base
GROUP BY first_year
ORDER BY first_year;
