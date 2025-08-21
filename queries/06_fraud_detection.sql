--7.Deteksi Potensi Fraud (Kartu Dark Web)
SELECT t.*
FROM alert-snowfall-469510-b3.technical_test.transactions_data t
JOIN alert-snowfall-469510-b3.technical_test.cards_data c ON t.card_id = c.id
WHERE c.card_on_dark_web = true;
