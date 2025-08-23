--12.Geographic Spending Patterns Bisa dipakai untuk strategi ekspansi marketing di kota tertentu. (geographic spending)
SELECT merchant_city, merchant_state, SUM(amount) AS total_spent
FROM alert-snowfall-469510-b3.technical_test.transactions_data
GROUP BY merchant_city, merchant_state
ORDER BY total_spent DESC
LIMIT 10;

-- Spending Online vs Offline per Card Type
SELECT
  CASE 
    WHEN t.merchant_city = 'ONLINE' THEN 'Online'
    ELSE 'Offline'
  END AS transaction_channel,
  c.card_type,
  SUM(t.amount) AS total_spent,
  AVG(t.amount) AS avg_spent
FROM alert-snowfall-469510-b3.technical_test.transactions_data t
JOIN alert-snowfall-469510-b3.technical_test.cards_data c
  ON t.card_id = c.id
WHERE t.amount IS NOT NULL
GROUP BY transaction_channel, c.card_type
ORDER BY transaction_channel, c.card_type;

