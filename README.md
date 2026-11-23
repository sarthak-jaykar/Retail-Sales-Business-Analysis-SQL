# Retail Sales Business Analysis

Where a retail business earns and loses money: regions, categories, customers, discounts, shipping, time and states. Built in PostgreSQL with 9,994 order lines from a secondary public retail dataset.

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql\&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-4-336791)
![SQL](https://img.shields.io/badge/SQL-Aggregation%20%7C%20Window%20Functions-informational)
![Domain](https://img.shields.io/badge/Domain-Business%20Analysis-success)

## Project Overview

A retail business wants to know how it is performing overall, where profit comes from, which products and customers lose money, and whether discounts pay off. The analysis turns ten business-case questions into SQL queries, each with a written insight and a recommendation.

The analysis answers these business questions:

1. How is the business performing overall?
2. Which region performs best and worst on sales and profit?
3. Which product categories contribute most to sales and profit?
4. Who are the highest-value customers, and are they profitable?
5. Which products generate the largest losses?
6. Does a higher discount reduce profitability?
7. How do sales change over the year?
8. Which shipping mode performs best?
9. Which states generate the most profit?
10. What should the business do first?

Scope covers orders from the secondary dataset. Costs other than the profit recorded in the data, customer acquisition and inventory are out of scope.

## Data Source

**Dataset:** Retail sales order lines, a public retail dataset borrowed from the internet. Labelled as a **secondary dataset from public sources**. 9,994 order lines, 21 columns, 5,009 distinct orders.

**File used:** `data/sales\_data.csv` (UTF-8, included in this repository). The dataset is treated as secondary data for educational portfolio analysis.

## Key Metrics (9,994 order lines)

|KPI|Result|
|-|-|
|Total sales|**$2,297,200.86**|
|Total profit|**$286,397.02** (12.5% of sales)|
|Average sales per line item|**$229.86**|
|Average sales per order|**$458.61** (5,009 orders)|
|Line items making a loss|**1,871** (18.7%)|
|Line items at 30% discount or more that make a loss|**96.8%**|

## Key Findings

These findings describe the secondary dataset. They show where sales and profit sit, not why.

1. **The business is profitable overall.** Profit is $286,397 on $2.30M of sales.
2. **The West earns the most profit, and the Central region the least.** West $108,418; East $91,523; South $46,749; Central $39,706.
3. **Technology leads on sales and profit.** Sales: Technology $836,154, Furniture $741,999, Office Supplies $719,047. Profit: Technology $145,455, Office Supplies $122,491, Furniture $18,451.
4. **The top customer loses money.** Sean Miller has the highest sales ($25,043) but a loss of $1,980. Tamara Chand ($19,052 sales, $8,981 profit) and Raymond Buch ($15,117 sales, $6,976 profit) are profitable.
5. **Some printers lose the most.** The Cubify CubeX 3D Printer (double-head print) lost $8,880, the Lexmark MX611dhe lost $4,590, and the Cubify triple-head print lost $3,840.
6. **Deep discounts destroy profit.** Line items at 30% discount or more lost $135,376 in total, and 96.8% of them made a loss. Line items with no discount earned $320,988.
7. **Sales peak in November.** November is the highest month at $352,461, followed by December at $325,294.
8. **Same Day shipping is the weakest option.** It has the lowest sales ($128,363) and profit ($15,892) of the four modes.
9. **California and New York lead on profit.** California earns $76,381 and New York $74,039.

## Recommended Actions

These are proposed actions, not proven results.

|Priority|Area|Action|Proposed target|
|-|-|-|-|
|**P1**|Discounts|Cap discounts at 30% unless a deal has a documented reason.|Share of loss-making line items at 30%+ discount|
|**P1**|Loss-making products|Review pricing and discounts for the Cubify and Lexmark printer lines.|Product margin positive within one quarter|
|**P2**|Central region|Review pricing, discounts and product mix in the Central region.|Central profit margin tracked monthly|
|**P2**|Furniture|Review furniture pricing, discounts and costs. Furniture earns $18,451 profit on $741,999 sales.|Furniture margin tracked monthly|
|**P2**|Key customers|Review discounts for high-sales customers whose total is a loss.|Customers in the top 10 by sales with positive profit|
|**P3**|Shipping|Review Same Day shipping economics.|Profit per Same Day line item|
|**P3**|Seasonality|Plan stock and promotions ahead of the November peak.|November sales against plan|

## Tools and Methodology

* **PostgreSQL and pgAdmin:** a setup script creates and loads the table; four query files answer the business questions.
* **SQL techniques:** aggregation, grouping, window functions (rank and running totals), date functions and filters.

**Data model:** one table, `sales`, with one row per order line. Column names are snake\_case. Dates are stored as dates (the source uses DD-MM-YYYY).

**Definitions**

* Profit: as recorded in the dataset. Costs other than profit are not in the data.
* Average sales per line item: total sales divided by line items.
* Average sales per order: total sales divided by distinct orders.
* Discount band: the discount on the line item.

**Validation**

* The setup script ends with a row count (expected 9,994).
* Totals and rankings were checked against the data. The profit total is $286,397.02.

## Repository Structure

```text
retail-sales-business-analysis-sql/
├── README.md
├── data/                              Included source dataset (sales\_data.csv, UTF-8)
├── documentation/
│   ├── 01\_business\_brief.md           Context, stakeholders, decisions, questions
│   ├── 02\_data\_and\_quality.md         Source, fields, quality decisions, reconciliation
│   └── 03\_findings\_and\_recommendations.md  KPI definitions, findings, actions
├── results/                           Query outputs exported from pgAdmin
├── screenshots/                       pgAdmin screenshots of execution and results
└── script/
    ├── 00\_setup/
    │   └── 01\_create\_and\_load\_sales.sql   Creates and loads the sales table
    ├── 01\_basic\_queries.sql
    ├── 02\_intermediate\_queries.sql
    ├── 03\_advanced\_queries.sql
    └── 04\_business\_case\_studies.sql       Ten business-case questions with insights
```

## Analysis

|Business question|Script|Output|
|-|-|-|
|Basic checks and totals|`script/01\_basic\_queries.sql`|`results/` (export from pgAdmin)|
|Intermediate analysis|`script/02\_intermediate\_queries.sql`|`results/`|
|Advanced analysis (window functions, trends, rankings)|`script/03\_advanced\_queries.sql`|`results/`|
|Ten business-case questions|`script/04\_business\_case\_studies.sql`|`results/`|

## Documentation

* [Business Brief](documentation/01_business_brief.md): stakeholders, decisions and questions
* [Data and Quality](documentation/02_data_and_quality.md): source, fields, quality decisions and checks
* [Findings and Recommendations](documentation/03_findings_and_recommendations.md): KPI definitions, findings and actions

## How to Reproduce

1. Create a PostgreSQL database named `retail\_sales` in pgAdmin.
2. Copy the included `data/sales\_data.csv` to `C:\\retail\_sales\_raw\\sales\_data.csv` so the PostgreSQL server can read it.
3. Run `script/00\_setup/01\_create\_and\_load\_sales.sql`, then the four analysis scripts in order.
4. Export each result to `results/`.

## Limitations

* **Secondary dataset:** a public copy, not checked against any company's records.
* **Profit only:** no cost detail beyond the profit recorded in the dataset.
* **No time beyond the file:** the analysis covers the dates in the file only.
* **Association only:** the reasons behind any pattern are not in the data.

## Author

[Sarthak Jaykar](https://www.linkedin.com/in/sarthak-jaykar/)

