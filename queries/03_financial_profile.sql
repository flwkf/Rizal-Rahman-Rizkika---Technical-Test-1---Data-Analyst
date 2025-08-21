--4.Kondisi Finansial User (financial profile)
SELECT 
    AVG(yearly_income) AS avg_income,
    AVG(total_debt) AS avg_debt,
    AVG(credit_score) AS avg_credit_score
FROM alert-snowfall-469510-b3.technical_test.users_data;


--8.Debt-to-Income Ratio (DTI) Indikator seberapa berat beban hutang user dibanding pendapatannya.(financial profile)
SELECT 
    id AS user_id,
    yearly_income,
    total_debt,
    (total_debt / NULLIF(yearly_income,0)) AS debt_to_income_ratio
FROM alert-snowfall-469510-b3.technical_test.users_data
ORDER BY debt_to_income_ratio DESC
LIMIT 10;
