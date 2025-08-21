--5.Ringkasan transaksi (transaction behaviour)
SELECT
    use_chip, 
    COUNT(*) AS total_transactions,
    AVG(amount) AS avg_amount
FROM alert-snowfall-469510-b3.technical_test.transactions_data
GROUP BY use_chip;


--6.Merchant Paling Populer (transaction behaviour)
SELECT merchant_city, COUNT(*) AS total_transactions
FROM alert-snowfall-469510-b3.technical_test.transactions_data
GROUP BY merchant_city
ORDER BY total_transactions DESC
LIMIT 5;



-- 13.Transaksi per bulan (transaction behaviour)
SELECT FORMAT_DATE('%Y-%m', DATE(date)) AS year_month,
       COUNT(*) AS total_transactions,
       SUM(amount) AS total_spent
FROM alert-snowfall-469510-b3.technical_test.transactions_data
GROUP BY year_month
ORDER BY year_month;

 

-- 14.Pengeluaran berdasarkan jenis kartu (transaction behaviour)
SELECT c.card_type, SUM(t.amount) AS total_spent
FROM alert-snowfall-469510-b3.technical_test.transactions_data t
JOIN alert-snowfall-469510-b3.technical_test.cards_data c ON t.card_id = c.id
GROUP BY c.card_type
ORDER BY total_spent DESC;
