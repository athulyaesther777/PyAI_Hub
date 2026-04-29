-- 1️⃣ LOAD DATASET
CREATE TABLE hr_data AS
SELECT * 
FROM read_csv_auto('HR_Employee_Attrition.csv');


-- 2️⃣ PART 1 — RISK PROFILE (CTE)
WITH Employee_Risk_Profile AS (
    SELECT 
        EmployeeNumber,
        Department,
        JobRole,
        Gender,

        CASE 
            WHEN Attrition = 'Yes' THEN TRUE 
            ELSE FALSE 
        END AS Attrition,

        MonthlyIncome,
        OverTime,
        YearsAtCompany,
        YearsWithCurrManager,
        JobSatisfaction,
        RelationshipSatisfaction,

        CASE 
            WHEN MonthlyIncome < 4500 AND OverTime = 'Yes' THEN 'Critical Risk'
            WHEN JobSatisfaction <= 2 AND RelationshipSatisfaction <= 2 THEN 'Cultural Risk'
            WHEN YearsAtCompany < 2 THEN 'Onboarding Risk'
            ELSE 'Stable'
        END AS Risk_Category

    FROM hr_data
)
SELECT * FROM Employee_Risk_Profile;


-- 3️⃣ PART 2 — SALARY FAIRNESS
SELECT 
    JobRole,
    CASE WHEN Attrition = 'Yes' THEN TRUE ELSE FALSE END AS Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Income,
    ROUND(AVG(MonthlyIncome) OVER (PARTITION BY JobRole), 2) AS Role_Market_Rate
FROM hr_data
GROUP BY JobRole, Attrition;


-- 4️⃣ PART 3 — MANAGER + OVERTIME
SELECT 
    YearsWithCurrManager,
    OverTime,
    COUNT(*) AS Headcount,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY YearsWithCurrManager, OverTime
HAVING COUNT(*) > 5;


-- 5️⃣ PART 4 — DEPARTMENT OUTPUT
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Department;


-- 6️⃣ PART 5 — COMPENSATION CONTEXT
SELECT 
    PercentSalaryHike,
    StockOptionLevel,
    COUNT(*) AS Total_Employees,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY PercentSalaryHike, StockOptionLevel;


-- 7️⃣ PART 6 — PERFORMANCE IMPACT
SELECT 
    PerformanceRating,
    COUNT(*) AS Total_Employees,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY PerformanceRating;


-- 8️⃣ PART 7 — LIFESTYLE FACTORS
SELECT 
    BusinessTravel,
    DistanceFromHome,
    COUNT(*) AS Total_Employees,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY BusinessTravel, DistanceFromHome;


-- 9️⃣ FINAL DATASET (TABLEAU READY)
CREATE TABLE final_attrition_dataset AS
SELECT 
    EmployeeNumber,
    Department,
    JobRole,
    Gender,

    CASE 
        WHEN Attrition = 'Yes' THEN TRUE 
        ELSE FALSE 
    END AS Attrition,

    -- Core
    MonthlyIncome,
    OverTime,
    YearsAtCompany,
    YearsWithCurrManager,

    -- Growth
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    TotalWorkingYears,

    -- Work Environment
    EnvironmentSatisfaction,
    JobInvolvement,
    WorkLifeBalance,

    -- Training
    TrainingTimesLastYear,

    -- Lifestyle
    DistanceFromHome,
    BusinessTravel,

    -- Compensation
    PercentSalaryHike,
    StockOptionLevel,

    -- Performance
    PerformanceRating,

    -- Satisfaction
    JobSatisfaction,
    RelationshipSatisfaction,

    -- Derived Columns
    CASE 
        WHEN MonthlyIncome < 4500 AND OverTime = 'Yes' THEN 'Critical Risk'
        WHEN JobSatisfaction <= 2 AND RelationshipSatisfaction <= 2 THEN 'Cultural Risk'
        WHEN YearsAtCompany < 2 THEN 'Onboarding Risk'
        ELSE 'Stable'
    END AS Risk_Category,

    CASE 
        WHEN MonthlyIncome < 4000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 4000 AND 8000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Level,

    CASE 
        WHEN YearsSinceLastPromotion > 4 THEN 'Promotion Risk'
        ELSE 'Growth Stable'
    END AS Growth_Risk,

    CASE 
        WHEN WorkLifeBalance <= 2 THEN 'Poor Balance'
        ELSE 'Good Balance'
    END AS WorkLife_Risk,

    CASE 
        WHEN DistanceFromHome > 20 THEN 'Far Distance'
        ELSE 'Near'
    END AS Commute_Risk

FROM hr_data;


-- 🔟 EXPORT FOR TABLEAU
COPY final_attrition_dataset
TO 'final_attrition_dataset.csv'
(WITH HEADER, DELIMITER ',');


D CREATE TABLE hr_data AS SELECT * FROM read_csv_auto('HR_Employee_Attrition.csv');
D DROP TABLE IF EXISTS final_attrition_dataset; CREATE TABLE final_attrition_dataset AS SELECT * FROM hr_data;
D COPY (SELECT * FROM final_attrition_dataset) TO 'final_attrition_dataset.csv' (HEADER, DELIMITER ',');

