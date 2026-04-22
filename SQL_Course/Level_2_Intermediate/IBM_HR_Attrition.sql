PS C:\Users\athul\Downloads\duckdb_installed> duckdb
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
D SELECT * FROM "HR_Employee_Attrition.csv" LIMIT 10;
┌───────┬───────────┬───┬────────────────────┬──────────────────────┬──────────────────────┐
│  Age  │ Attrition │ … │ YearsInCurrentRole │ YearsSinceLastProm…  │ YearsWithCurrManager │
│ int64 │  boolean  │   │       int64        │        int64         │        int64         │
├───────┼───────────┼───┼────────────────────┼──────────────────────┼──────────────────────┤
│    41 │ true      │ … │                  4 │                    0 │                    5 │
│    49 │ false     │ … │                  7 │                    1 │                    7 │
│    37 │ true      │ … │                  0 │                    0 │                    0 │
│    33 │ false     │ … │                  7 │                    3 │                    0 │
│    27 │ false     │ … │                  2 │                    2 │                    2 │
│    32 │ false     │ … │                  7 │                    3 │                    6 │
│    59 │ false     │ … │                  0 │                    0 │                    0 │
│    30 │ false     │ … │                  0 │                    0 │                    0 │
│    38 │ false     │ … │                  7 │                    1 │                    8 │
│    36 │ false     │ … │                  7 │                    7 │                    7 │
├───────┴───────────┴───┴────────────────────┴──────────────────────┴──────────────────────┤
│ 10 rows                                                             35 columns (5 shown) │
└──────────────────────────────────────────────────────────────────────────────────────────┘
D CREATE TABLE hr_data AS SELECT * FROM "HR_Employee_Attrition.csv" LIMIT 10;
D SHOW TABLES;
┌─────────┐
│  name   │
│ varchar │
├─────────┤
│ hr_data │
└─────────┘
D SELECT * FROM hr_data LIMIT 10;
┌───────┬───────────┬───┬────────────────────┬──────────────────────┬──────────────────────┐
│  Age  │ Attrition │ … │ YearsInCurrentRole │ YearsSinceLastProm…  │ YearsWithCurrManager │
│ int64 │  boolean  │   │       int64        │        int64         │        int64         │
├───────┼───────────┼───┼────────────────────┼──────────────────────┼──────────────────────┤
│    41 │ true      │ … │                  4 │                    0 │                    5 │
│    49 │ false     │ … │                  7 │                    1 │                    7 │
│    37 │ true      │ … │                  0 │                    0 │                    0 │
│    33 │ false     │ … │                  7 │                    3 │                    0 │
│    27 │ false     │ … │                  2 │                    2 │                    2 │
│    32 │ false     │ … │                  7 │                    3 │                    6 │
│    59 │ false     │ … │                  0 │                    0 │                    0 │
│    30 │ false     │ … │                  0 │                    0 │                    0 │
│    38 │ false     │ … │                  7 │                    1 │                    8 │
│    36 │ false     │ … │                  7 │                    7 │                    7 │
├───────┴───────────┴───┴────────────────────┴──────────────────────┴──────────────────────┤
│ 10 rows                                                             35 columns (5 shown) │
└──────────────────────────────────────────────────────────────────────────────────────────┘
D DESCRIBE hr_data;
┌──────────────────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐
│       column_name        │ column_type │  null   │   key   │ default │  extra  │
│         varchar          │   varchar   │ varchar │ varchar │ varchar │ varchar │
├──────────────────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤
│ Age                      │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ Attrition                │ BOOLEAN     │ YES     │ NULL    │ NULL    │ NULL    │
│ BusinessTravel           │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ DailyRate                │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ Department               │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ DistanceFromHome         │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ Education                │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ EducationField           │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ EmployeeCount            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ EmployeeNumber           │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ EnvironmentSatisfaction  │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ Gender                   │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ HourlyRate               │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ JobInvolvement           │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ JobLevel                 │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ JobRole                  │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ JobSatisfaction          │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ MaritalStatus            │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ MonthlyIncome            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ MonthlyRate              │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ NumCompaniesWorked       │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ Over18                   │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
│ OverTime                 │ BOOLEAN     │ YES     │ NULL    │ NULL    │ NULL    │
│ PercentSalaryHike        │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ PerformanceRating        │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ RelationshipSatisfaction │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ StandardHours            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ StockOptionLevel         │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ TotalWorkingYears        │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ TrainingTimesLastYear    │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ WorkLifeBalance          │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ YearsAtCompany           │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ YearsInCurrentRole       │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ YearsSinceLastPromotion  │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
│ YearsWithCurrManager     │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
├──────────────────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┤
│ 35 rows                                                              6 columns │
└────────────────────────────────────────────────────────────────────────────────┘
D WITH Employee_Risk_Profile AS (SELECT EmployeeNumber, Department, JobRole, Attrition, MonthlyIncome, OverTime, TotalWorkingYears, JobSatisfaction, RelationshipSatisfaction, YearsAtCompany, CASE WHEN MonthlyIncome < 4500 AND OverTime = 'Yes' THEN 'Critical Risk' WHEN JobSatisfaction <= 2 AND RelationshipSatisfaction <= 2 THEN 'Cultural Risk' WHEN YearsAtCompany < 2 THEN 'Onboarding Risk' ELSE 'Stable' END AS Risk_Category FROM hr_data) SELECT * FROM Employee_Risk_Profile;
┌────────────────┬──────────────────────┬───┬──────────────────────┬────────────────┬─────────────────┐
│ EmployeeNumber │      Department      │ … │ RelationshipSatisf…  │ YearsAtCompany │  Risk_Category  │
│     int64      │       varchar        │   │        int64         │     int64      │     varchar     │
├────────────────┼──────────────────────┼───┼──────────────────────┼────────────────┼─────────────────┤
│              1 │ Sales                │ … │                    1 │              6 │ Stable          │
│              2 │ Research & Develop…  │ … │                    4 │             10 │ Stable          │
│              4 │ Research & Develop…  │ … │                    2 │              0 │ Critical Risk   │
│              5 │ Research & Develop…  │ … │                    3 │              8 │ Critical Risk   │
│              7 │ Research & Develop…  │ … │                    4 │              2 │ Stable          │
│              8 │ Research & Develop…  │ … │                    3 │              7 │ Stable          │
│             10 │ Research & Develop…  │ … │                    1 │              1 │ Critical Risk   │
│             11 │ Research & Develop…  │ … │                    2 │              1 │ Onboarding Risk │
│             12 │ Research & Develop…  │ … │                    2 │              9 │ Stable          │
│             13 │ Research & Develop…  │ … │                    2 │              7 │ Stable          │
├────────────────┴──────────────────────┴───┴──────────────────────┴────────────────┴─────────────────┤
│ 10 rows                                                                        11 columns (5 shown) │
└─────────────────────────────────────────────────────────────────────────────────────────────────────┘
D SELECT JobRole, Attrition, COUNT(*) AS Employee_Count, ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Market_Rate FROM hr_data GROUP BY JobRole, Attrition ORDER BY JobRole, Attrition DESC;
Binder Error:
column "MonthlyIncome" must appear in the GROUP BY clause or must be part of an aggregate function.
Either add it to the GROUP BY list, or use "ANY_VALUE(MonthlyIncome)" if the exact value of "MonthlyIncome" is not important.

LINE 1: ..., ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Mark...
                                                                   ^
D SELECT JobRole, Attrition, COUNT(*) AS Employee_Count, ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Market_Rate FROM hr_data GROUP BY JobRole, Attrition ORDER BY JobRole, Attrition DESC;
Binder Error:
column "MonthlyIncome" must appear in the GROUP BY clause or must be part of an aggregate function.
Either add it to the GROUP BY list, or use "ANY_VALUE(MonthlyIncome)" if the exact value of "MonthlyIncome" is not important.

LINE 1: ..., ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Mark...
                                                                   ^
D WITH RoleStats AS (SELECT JobRole, Attrition, COUNT(*) AS Employee_Count, ROUND(AVG(MonthlyIncome), 2) AS Avg_Income FROM hr_data GROUP BY JobRole, Attrition) SELECT JobRole, Attrition, Employee_Count, Avg_Income, ROUND(AVG(Avg_Income) OVER (PARTITION BY JobRole), 2) AS Role_Market_Rate FROM RoleStats ORDER BY JobRole, Attrition DESC;
┌───────────────────────────┬───────────┬────────────────┬────────────┬──────────────────┐
│          JobRole          │ Attrition │ Employee_Count │ Avg_Income │ Role_Market_Rate │
│          varchar          │  boolean  │     int64      │   double   │      double      │
├───────────────────────────┼───────────┼────────────────┼────────────┼──────────────────┤
│ Healthcare Representative │ false     │              1 │     5237.0 │           5237.0 │
│ Laboratory Technician     │ true      │              1 │     2090.0 │          2532.38 │
│ Laboratory Technician     │ false     │              4 │    2974.75 │          2532.38 │
│ Manufacturing Director    │ false     │              1 │     9526.0 │           9526.0 │
│ Research Scientist        │ false     │              2 │     4019.5 │           4019.5 │
│ Sales Executive           │ true      │              1 │     5993.0 │           5993.0 │
└───────────────────────────┴───────────┴────────────────┴────────────┴──────────────────┘
D SELECT YearsWithCurrManager, OverTime, COUNT() AS Headcount, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate FROM hr_data WHERE Department = 'Research & Development' GROUP BY YearsWithCurrManager, OverTime HAVING COUNT() > 5 ORDER BY Attrition_Rate DESC;
┌──────────────────────┬──────────┬───────────┬────────────────┐
│ YearsWithCurrManager │ OverTime │ Headcount │ Attrition_Rate │
│        int64         │ boolean  │   int64   │     double     │
├──────────────────────┴──────────┴───────────┴────────────────┤
│                            0 rows                            │
└──────────────────────────────────────────────────────────────┘
D SELECT YearsWithCurrManager, OverTime, COUNT() AS Headcount, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) AS Attrition_Rate FROM hr_data WHERE Department = 'Research & Development' GROUP BY YearsWithCurrManager, OverTime HAVING COUNT() > 5 ORDER BY Attrition_Rate DESC;
┌──────────────────────┬──────────┬───────────┬────────────────┐
│ YearsWithCurrManager │ OverTime │ Headcount │ Attrition_Rate │
│        int64         │ boolean  │   int64   │     double     │
├──────────────────────┴──────────┴───────────┴────────────────┤
│                            0 rows                            │
└──────────────────────────────────────────────────────────────┘
D SELECT YearsWithCurrManager, OverTime, COUNT(*) AS Headcount, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) AS Attrition_Rate FROM hr_data WHERE Department ILIKE 'Research & Development' GROUP BY YearsWithCurrManager, OverTime HAVING COUNT(*) > 5 ORDER BY Attrition_Rate DESC;
┌──────────────────────┬──────────┬───────────┬────────────────┐
│ YearsWithCurrManager │ OverTime │ Headcount │ Attrition_Rate │
│        int64         │ boolean  │   int64   │     double     │
├──────────────────────┴──────────┴───────────┴────────────────┤
│                            0 rows                            │
└──────────────────────────────────────────────────────────────┘
D SELECT Department, JobRole, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Exits, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) AS Attrition_PCT, CASE WHEN AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) > 0.25 THEN 'IMMEDIATE ACTION: Retention Bonus Needed' WHEN AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) BETWEEN 0.15 AND 0.25 THEN 'WARNING: Review Management' ELSE 'Healthy' END AS HR_Action_Plan FROM hr_data GROUP BY Department, JobRole ORDER BY Attrition_PCT DESC;
┌──────────────────────┬──────────────────────┬─────────────┬───────────────┬──────────────────────────┐
│      Department      │       JobRole        │ Total_Exits │ Attrition_PCT │      HR_Action_Plan      │
│       varchar        │       varchar        │   int128    │    double     │         varchar          │
├──────────────────────┼──────────────────────┼─────────────┼───────────────┼──────────────────────────┤
│ Sales                │ Sales Executive      │           1 │         100.0 │ IMMEDIATE ACTION: Rete…  │
│ Research & Develop…  │ Laboratory Technic…  │           1 │          20.0 │ WARNING: Review Manage…  │
│ Research & Develop…  │ Healthcare Represe…  │           0 │           0.0 │ Healthy                  │
│ Research & Develop…  │ Research Scientist   │           0 │           0.0 │ Healthy                  │
│ Research & Develop…  │ Manufacturing Dire…  │           0 │           0.0 │ Healthy                  │
└──────────────────────┴──────────────────────┴─────────────┴───────────────┴──────────────────────────┘
D SELECT Gender, COUNT() AS Total_Employees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Exited, ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(), 2) AS Attrition_Rate FROM hr_data GROUP BY Gender;
┌─────────┬─────────────────┬──────────────┬────────────────┐
│ Gender  │ Total_Employees │ Total_Exited │ Attrition_Rate │
│ varchar │      int64      │    int128    │     double     │
├─────────┼─────────────────┼──────────────┼────────────────┤
│ Female  │               3 │            1 │          33.33 │
│ Male    │               7 │            1 │          14.29 │
└─────────┴─────────────────┴──────────────┴────────────────┘
D CREATE VIEW full_attrition_analysis AS WITH Employee_Risk_Profile AS (SELECT EmployeeNumber, Department, JobRole, Attrition, MonthlyIncome, OverTime, TotalWorkingYears, JobSatisfaction, RelationshipSatisfaction, YearsAtCompany, CASE WHEN MonthlyIncome < 4500 AND OverTime = 'Yes' THEN 'Critical Risk' WHEN JobSatisfaction <= 2 AND RelationshipSatisfaction <= 2 THEN 'Cultural Risk' WHEN YearsAtCompany < 2 THEN 'Onboarding Risk' ELSE 'Stable' END AS Risk_Category FROM hr_data), Salary_Analysis AS (SELECT JobRole, Attrition, COUNT() AS Employee_Count, ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Market_Rate FROM hr_data GROUP BY JobRole, Attrition), Manager_Analysis AS (SELECT YearsWithCurrManager, OverTime, COUNT() AS Headcount, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) AS Attrition_Rate FROM hr_data GROUP BY YearsWithCurrManager, OverTime HAVING COUNT() > 5), Gender_Analysis AS (SELECT Gender, COUNT() AS Total_Employees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Exited, ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate FROM hr_data GROUP BY Gender) SELECT * FROM Employee_Risk_Profile;
Binder Error:
column "MonthlyIncome" must appear in the GROUP BY clause or must be part of an aggregate function.
Either add it to the GROUP BY list, or use "ANY_VALUE(MonthlyIncome)" if the exact value of "MonthlyIncome" is not important.

LINE 1: ..., ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Mark...
                                                                   ^
D CREATE VIEW full_attrition_analysis AS WITH Employee_Risk_Profile AS (SELECT EmployeeNumber, Department, JobRole, Attrition, MonthlyIncome, OverTime, TotalWorkingYears, JobSatisfaction, RelationshipSatisfaction, YearsAtCompany, CASE WHEN MonthlyIncome < 4500 AND OverTime = 'Yes' THEN 'Critical Risk' WHEN JobSatisfaction <= 2 AND RelationshipSatisfaction <= 2 THEN 'Cultural Risk' WHEN YearsAtCompany < 2 THEN 'Onboarding Risk' ELSE 'Stable' END AS Risk_Category FROM hr_data), Salary_Analysis AS (SELECT JobRole, Attrition, COUNT(*) AS Employee_Count, ROUND(AVG(MonthlyIncome), 2) AS Avg_Income, ROUND(AVG(AVG(MonthlyIncome)) OVER (PARTITION BY JobRole), 2) AS Role_Market_Rate FROM hr_data GROUP BY JobRole, Attrition), Manager_Analysis AS (SELECT YearsWithCurrManager, OverTime, COUNT(*) AS Headcount, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) AS Attrition_Rate FROM hr_data GROUP BY YearsWithCurrManager, OverTime HAVING COUNT(*) > 5), Gender_Analysis AS (SELECT Gender, COUNT(*) AS Total_Employees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Exited, ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate FROM hr_data GROUP BY Gender) SELECT * FROM Employee_Risk_Profile;
D COPY full_attrition_analysis TO 'full_attrition_analysis.csv' (HEADER, DELIMITER ',');
D

