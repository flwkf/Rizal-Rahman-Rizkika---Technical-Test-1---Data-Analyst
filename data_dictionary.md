

# 📘 **Data Dictionary**

---

## 1. `users_data.csv`

| Column              | Data Type | Description                                                       |
| ------------------- | --------- | ----------------------------------------------------------------- |
| `id`                | INT       | Unique identifier for each user.                                  |
| `current_age`       | INT       | Current age of the user.                                          |
| `retirement_age`    | INT       | Expected retirement age of the user.                              |
| `birth_year`        | INT       | Year of birth of the user.                                        |
| `birth_month`       | INT       | Month of birth of the user.                                       |
| `gender`            | STRING    | Gender of the user (Male/Female).                                 |
| `address`           | STRING    | Residential address of the user.                                  |
| `latitude`          | FLOAT     | Latitude coordinate of the user’s location.                       |
| `longitude`         | FLOAT     | Longitude coordinate of the user’s location.                      |
| `per_capita_income` | STRING    | Per capita income of the household (string with currency symbol). |
| `yearly_income`     | STRING    | Annual income of the user (string with currency symbol).          |
| `total_debt`        | STRING    | Total outstanding debt of the user (string with currency symbol). |
| `credit_score`      | INT       | Credit score of the user.                                         |
| `num_credit_cards`  | INT       | Number of credit cards owned by the user.                         |

---

## 2. `cards_data.csv`

| Column                  | Data Type | Description                                             |
| ----------------------- | --------- | ------------------------------------------------------- |
| `id`                    | INT       | Unique identifier for each card.                        |
| `client_id`             | INT       | User ID (foreign key linking to `users_data.id`).       |
| `card_brand`            | STRING    | Card brand (e.g., Visa, Mastercard, etc.).              |
| `card_type`             | STRING    | Type of card (Debit, Credit, Prepaid).                  |
| `card_number`           | INT       | Unique card number.                                     |
| `expires`               | STRING    | Card expiration date (MM/YYYY).                         |
| `cvv`                   | INT       | Card CVV security code.                                 |
| `has_chip`              | STRING    | Indicates if the card has a chip (YES/NO).              |
| `num_cards_issued`      | INT       | Number of cards issued for the user.                    |
| `credit_limit`          | STRING    | Credit limit of the card (string with currency symbol). |
| `acct_open_date`        | STRING    | Date when the card account was opened.                  |
| `year_pin_last_changed` | INT       | Year the card PIN was last changed.                     |
| `card_on_dark_web`      | STRING    | Whether the card was found on the dark web (Yes/No).    |

---

## 3. `transactions_data.csv`

| Column           | Data Type | Description                                                                   |
| ---------------- | --------- | ----------------------------------------------------------------------------- |
| `id`             | INT       | Unique identifier for each transaction.                                       |
| `date`           | STRING    | Date and time of the transaction.                                             |
| `client_id`      | INT       | User ID (foreign key linking to `users_data.id`).                             |
| `card_id`        | INT       | Card ID (foreign key linking to `cards_data.id`).                             |
| `amount`         | STRING    | Transaction amount (positive = purchase, negative = refund).                  |
| `use_chip`       | STRING    | Transaction method (Swipe Transaction, Chip Transaction, Online Transaction). |
| `merchant_id`    | INT       | Identifier of the merchant.                                                   |
| `merchant_city`  | STRING    | City where the merchant is located.                                           |
| `merchant_state` | STRING    | State where the merchant is located.                                          |
| `zip`            | FLOAT     | Merchant ZIP code.                                                            |
| `mcc`            | INT       | Merchant Category Code (business classification).                             |
| `errors`         | STRING    | Error details if a transaction failed (mostly NULL).                          |

