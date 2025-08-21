--12.Geographic Spending Patterns Bisa dipakai untuk strategi ekspansi marketing di kota tertentu. (geographic spending)
SELECT merchant_city, merchant_state, SUM(amount) AS total_spent
FROM alert-snowfall-469510-b3.technical_test.transactions_data
GROUP BY merchant_city, merchant_state
ORDER BY total_spent DESC
LIMIT 10;
