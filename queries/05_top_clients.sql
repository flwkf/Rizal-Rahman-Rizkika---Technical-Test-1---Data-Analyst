--10.Top High-Value Clients (Siapa user dengan transaksi terbesar → bisa jadi target untuk loyalty program.) (TOP CUSTOMERs)
SELECT u.id, u.gender, u.current_age, SUM(t.amount) AS total_spent
FROM alert-snowfall-469510-b3.technical_test.transactions_data t
JOIN alert-snowfall-469510-b3.technical_test.users_data u ON u.id = t.client_id
GROUP BY u.id, u.gender, u.current_age
ORDER BY total_spent DESC
LIMIT 10;