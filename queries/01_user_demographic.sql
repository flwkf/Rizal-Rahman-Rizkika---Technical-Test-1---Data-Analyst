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

-- Rata-rata usia nasabah baru per tahun
WITH base AS (
  -- Subquery untuk dapatkan first_year, age_at_first_txn, dan total_users
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
