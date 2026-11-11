# Data and Quality

## Source
| Field | Value |
| --- | --- |
| Dataset | Retail sales order lines |
| Label | Secondary dataset from public sources (borrowed from the internet) |
| File used | `data/sales_data.csv` (UTF-8; included) |
| Grain | one row per order line (Row ID is unique) |
| Size | 9,994 rows, 21 columns, 5,009 distinct orders |
| Period | Dates in DD-MM-YYYY format (2014 to 2017 in the file) |

## Table: `sales`

| Column | Type | Meaning |
| --- | --- | --- |
| row_id | integer, primary key | Order line number |
| order_id | text | Order identifier |
| order_date, ship_date | date | Order and shipping dates |
| ship_mode | text | Shipping mode (Standard, Second, First, Same Day) |
| customer_id, customer_name | text | Customer |
| segment, country, city, state, postal_code, region | text | Customer and location |
| product_id, category, sub_category, product_name | text | Product |
| sales | numeric(12,2) | Sales value of the line |
| quantity | integer | Units |
| discount | numeric(5,2) | Discount on the line (0 to 1) |
| profit | numeric(12,4) | Profit on the line, as recorded |

## Quality decisions

| # | Issue | Decision |
| --- | --- | --- |
| 1 | Two copies of the same data in different encodings | Verified identical (9,994 × 21); retained one UTF-8 copy as `sales_data.csv` and removed the duplicate. |
| 2 | Dates stored as text in DD-MM-YYYY | Loaded as text, then converted to dates in the setup script |
| 3 | Column names with spaces and hyphens | Renamed to snake_case in the setup script |
| 4 | Column renames run after load in the original scripts | Moved into the setup script, so the analysis scripts run without them |
| 5 | "Average Order Value" was the average per line item | Relabelled as average sales per line item; average per order ($458.61) shown beside it |
| 6 | Profit total in one comment was $286,397.03 | Corrected to $286,397.02 |
| 7 | No duplicate row IDs, no missing values, no ship dates before order dates | Checked and reported |

## Reconciliation

| Check | Expected | Result |
| --- | --- | --- |
| Rows loaded | 9,994 | 9,994 (setup script check) |
| Total sales | $2,297,200.86 | $2,297,200.86 |
| Total profit | $286,397.02 | $286,397.02 |
| Distinct orders | 5,009 | 5,009 |
| Line items at 30%+ discount | 1,393 | 1,393 |
