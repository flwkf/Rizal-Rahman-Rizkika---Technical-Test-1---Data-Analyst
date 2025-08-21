--3.Jumlah Kartu per User (cards usage)
SELECT client_id, COUNT(*) AS total_cards
FROM alert-snowfall-469510-b3.technical_test.cards_data
GROUP BY client_id
ORDER BY total_cards DESC;


--4.Distribusi Jenis Kartu (Card Type Distribution)(cards usage)
SELECT 
    card_type,
    COUNT(*) AS total_cards
FROM alert-snowfall-469510-b3.technical_test.cards_data
GROUP BY card_type
ORDER BY total_cards DESC;


--11.Customer Lifetime Value (CLV) sederhana (Menggunakan rata-rata pengeluaran × jumlah kartu.)Bisa kasih prediksi siapa customer yang paling bernilai jangka panjang.(cards usage)
WITH card_count AS (
  SELECT client_id, COUNT(*) AS total_cards
  FROM alert-snowfall-469510-b3.technical_test.cards_data
  GROUP BY client_id
)
SELECT u.id,
       u.yearly_income,
       cc.total_cards,               
       AVG(t.amount) * cc.total_cards AS estimated_clv
FROM alert-snowfall-469510-b3.technical_test.users_data u
JOIN card_count cc ON u.id = cc.client_id
JOIN alert-snowfall-469510-b3.technical_test.cards_data c 
     ON u.id = c.client_id
JOIN alert-snowfall-469510-b3.technical_test.transactions_data t 
     ON c.id = t.card_id
GROUP BY u.id, u.yearly_income, cc.total_cards
ORDER BY estimated_clv DESC limit 10;

