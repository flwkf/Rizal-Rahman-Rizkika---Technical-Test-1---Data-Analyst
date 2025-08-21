# 📊  User Behavior Analysis – Technical Test

This project contains a collection of **SQL queries** for analyzing user, card, and transaction data using **Google BigQuery**.

---

## 🗂 **Repository Structure**
```
├── README.md
├── data_dictionary.md
├── Presentation.pdf
├── data/
│ ├── users_data.csv
│ ├── cards_data.csv
│ └── transactions_data.csv
└── queries/
├── 01_user_demographic.sql
├── 02_cards_usage.sql
├── 03_financial_profile.sql
├── 04_transactions_behavior.sql
├── 05_top_clients.sql
├── 06_fraud_detection.sql
└── 07_error_reliability.sql
├── 08_geographic_spending.sql
```

---

## 📘 **Data Dictionary**
Detailed column descriptions are available in [data_dictionary.md](./data_dictionary.md) for:
- `users_data.csv`
- `cards_data.csv`
- `transactions_data.csv`

---

## ⚙ **Setup Instructions**
1. Go to [Google BigQuery Console](https://console.cloud.google.com/bigquery).
2. Create a **Project** or use an existing one, for example:  
   `alert-snowfall-469510-b3`
3. Create a **dataset** named:  
   `technical_test`
4. Upload the CSV files into the dataset:
   - `users_data.csv`
   - `cards_data.csv`
   - `transactions_data.csv`
5. Ensure the table names match exactly:
   - `users_data`
   - `cards_data`
   - `transactions_data`

---

## ▶ **How to Run the Queries**
1. Open the **BigQuery SQL Editor**.
2. Select your **Project** and **Dataset**.
3. Open one of the query files in the `queries/` folder.
4. Copy and paste the SQL code into the editor.
5. Click **Run** to execute the query.
6. View the results in the **Results** panel.

---

## 📌 **Analysis Categories**

| Query File | Analysis Included |
|------------|------------------|
| **01_user_demographic.sql** | User gender distribution, user age statistics. |
| **02_cards_usage.sql** | Number of cards per user, card type distribution, customer lifetime value (CLV). |
| **03_financial_profile.sql** | Average income, total debt, credit scores, and debt-to-income ratio (DTI). |
| **04_transactions_behavior.sql** | Transaction summary, top merchant cities, high-value customers, geographic spending, monthly transactions, spending by card type. |
| **05_top_clients.sql** | high-value customers|
| **06_fraud_detection.sql** | Fraud detection for cards found on the dark web. |
| **07_error_reliability.sql** | Transaction error distribution, error types, detailed error logs. |
| **08_geographic_spending.sql** | geographic spending|

---

## 💻 **Example Queries**

### 1. User Gender Distribution
```sql
SELECT gender, COUNT(*) AS total_users
FROM `alert-snowfall-469510-b3.technical_test.users_data`
GROUP BY gender;


