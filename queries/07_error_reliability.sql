-- 15.Distribusi Transaksi Error by Method (Error & Reliability)
SELECT 
    use_chip,
    COUNT(*) AS total_errors
FROM alert-snowfall-469510-b3.technical_test.transactions_data
WHERE errors IS NOT NULL
GROUP BY use_chip;


--16. Jenis Error yang Muncul (Error & Reliability)
SELECT 
    errors,
    COUNT(*) AS total_occurrences
FROM alert-snowfall-469510-b3.technical_test.transactions_data
WHERE errors IS NOT NULL
GROUP BY errors
ORDER BY total_occurrences DESC;


--17. Detail Transaksi Error (Error & Reliability)
SELECT 
    id AS transaction_id,
    date,
    client_id,
    card_id,
    amount,
    use_chip,
    merchant_city,
    merchant_state,
    mcc,
    errors
FROM alert-snowfall-469510-b3.technical_test.transactions_data
WHERE errors IS NOT NULL;