# Smartphone-Usage-Addiction-Analysis-using-SQL
## Project Overview

This project performs an **in-depth exploratory data analysis (EDA)** on a dataset of **7,500 individuals** to uncover the real impact of smartphone usage on sleep, productivity, and digital addiction.

Using only SQL Server, I imported messy Excel data, built a clean analytical layer, and extracted powerful insights into how daily screen time, social media usage, phone checking habits, and demographics influence mental well-being and productivity in modern life.

The analysis reveals clear patterns: heavier smartphone users sleep less, report lower productivity, and show significantly higher addiction risk  especially among young adults and students.
## Business / Research Problem

With average daily screen time now exceeding 6 hours globally, understanding smartphone addiction has become critical for:
- Digital wellness apps and mental health platforms
- HR and workplace productivity studies
- Public health research on behavioral addiction

This project demonstrates how **SQL** can turn raw behavioral data into actionable insights without needing Python or R for the core analysis.

## 📁 Repository Structure

```bash
Smartphone-Usage-Addiction-Analysis/
├── data/
│   └── raw/                    # Original Excel file (Smartphone_Usage_And_Addiction)
├── sql/
│   ├── 01_import_and_setup.sql
│   ├── 02_create_analytical_view.sql
│   ├── 03_exploratory_queries.sql
│   └── 04_key_insights.sql
├── views/
│   └── vw_Smartphone_Analysis.sql
├── visualizations/             
├── README.md
└── LICENSE
```
## Key Steps in the Project

1. Data Import — Successfully imported 7,500 records from Excel into SQL Server, resolving common wizard errors (column metadata issues and duplicate destination table names).
2. Data Preparation — Created a clean, reusable analytical VIEW with derived categories:
- Screen Time Categories (Light <3h, Moderate 3-6h, Heavy 6-9h, Extreme >9h)
- Age Groups, Sleep Quality, and Productivity Score

3. Exploratory Analysis — Ran 10+ targeted SQL queries covering:
- Descriptive statistics
- Demographic breakdowns
- Addiction level impact
- Correlations between screen time, sleep, and productivity

4. Insight Generation — Identified high-risk user segments and key behavioral patterns.

## Key Findings

- Average daily screen time: 7.5 hours
- Users with >6 hours screen time (42% of dataset) sleep 1.4 hours less on average and show ~35% lower productivity scores.
- Young Adults (18-25) record the highest screen time (7.5 hours) and highest rate of "High Addiction".
- Students emerge as the most at-risk occupation group — highest app opens, phone checks, and lowest sleep duration.
- Strong negative relationship: Higher phone checking frequency (>30 times/day) makes users 2.3× more likely to report low productivity.
- Nearly 48% of users exceeding 8 hours of screen time fall into the "High Addiction" category.

These findings highlight the urgent need for better digital wellness interventions, especially targeting younger demographics.

## Future Enhancements

- Add machine learning-based addiction prediction (using Python + SQL integration)
- Build an interactive Power BI dashboard
- Compare findings with other public digital addiction datasets
- Time-series analysis if longitudinal data becomes available
