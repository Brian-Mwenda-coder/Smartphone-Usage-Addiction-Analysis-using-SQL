
--Create derived categories using the CASE statement to make analysis much more insightful
CREATE OR ALTER VIEW vw_Smartphone_Analysis AS
SELECT
	*,
	--Screen Time Category
	CASE
		WHEN daily_screen_time_hours < 3 THEN 'Light (<3h)'
		WHEN daily_screen_time_hours < 6 THEN 'Moderate (3-6h)'
		WHEN daily_screen_time_hours < 9 THEN 'Heavy (6-9h)'
		ELSE 'Extreme (>9h)'
	END AS Screen_Time_Category,

	--Age Group
	CASE 
		WHEN age < 18 THEN 'Teen (<18)'
		WHEN age <= 25 THEN 'Young Adult (18-25)'
		WHEN age <= 35 THEN 'Adult (26-35)'
		ELSE 'Senior (36+)'
	END AS Age_Group,

	--Sleep Quality
	CASE
		WHEN sleep_hours < 5 THEN 'Very Poor (<5h)'
		WHEN sleep_hours < 7 THEN 'Poor (5-7h)'
		WHEN sleep_hours <= 8 THEN 'Good(7-8h)'
		ELSE 'Excellent(>8h)'
	END AS Sleep_Quality
FROM Smartphone_Usage_And_Addiction

-- 1. Overall Summary Stastitics
SELECT
	COUNT(*) AS Total_Users,
	ROUND(AVG(daily_screen_time_hours),1) AS AVG_Screen_Time,
	ROUND(AVG(sleep_hours),1) AS AVG_Slepp_Hour,
	ROUND(AVG(app_opens_per_day),1) AS AVG_App_Open,
	ROUND(AVG(social_media_hours),1) AS AVG_Social_Media_Hour
FROM vw_Smartphone_Analysis

	-- 2. Usage & Impact by Screen Time Category
SELECT
	Screen_Time_Category,
	COUNT(*) AS User_Count,
	ROUND(AVG(daily_screen_time_hours),1) AS AVG_Screen_Time,
	ROUND(AVG(sleep_hours),1) AS AVG_Sleep,
	ROUND(AVG(social_media_hours),1) AS AVG_Social_Media_Hour,
	ROUND(AVG(CASE WHEN addiction_level IN ('Severe') THEN 100.0 ELSE 0 END),1) AS Pct_High_Addiction
FROM vw_Smartphone_Analysis
GROUP BY Screen_Time_Category
ORDER BY Avg_Screen_Time DESC


	--3. Demographic Breakdown (Age Group + Gender)
SELECT
	Age_Group,
	gender,
	COUNT(*) AS Users,
	ROUND(AVG(daily_screen_time_hours),1) AS AVG_Screen_Time,
	ROUND(AVG(sleep_hours),1) AS AVG_Sleep,
	ROUND(AVG(social_media_hours),1) AS AVG_Social_Media
FROM vw_Smartphone_Analysis
GROUP BY Age_Group, gender
ORDER BY Age_Group DESC

	--4. Demographic Breakdown By Age Group
SELECT
	Age_Group,
	COUNT(*) AS Users,
	ROUND(AVG(daily_screen_time_hours),1) AS AVG_Screen_Time,
	ROUND(AVG(sleep_hours),1) AS AVG_Sleep,
	ROUND(AVG(social_media_hours),1) AS AVG_Social_Media
FROM vw_Smartphone_Analysis
GROUP BY Age_Group
ORDER BY Age_Group DESC
	--4. Addiction Level Distribution
SELECT
  COALESCE(addiction_level, 'Unknown') AS level,
  COUNT(*) AS user_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS pct
FROM vw_Smartphone_Analysis
GROUP BY COALESCE(addiction_level, 'Unknown')
ORDER BY user_count DESC;

	--5. Screen Time By Addiction Level
SELECT
  addiction_level,
  ROUND(AVG(app_opens_per_day), 2)      AS avg_app_open_per_day,
  ROUND(AVG(daily_screen_time_hours), 2) AS avg_daily_hrs,
  ROUND(AVG(weekend_screen_time), 2)     AS avg_weekend_hrs,
  ROUND(AVG(social_media_hours), 2)       AS avg_social_media_hrs,
  COUNT(*) AS Users
FROM vw_Smartphone_Analysis
WHERE addiction_level IS NOT NULL
GROUP BY addiction_level
ORDER BY
  CASE addiction_level
    WHEN 'Mild'     THEN 1
    WHEN 'Moderate' THEN 2
    WHEN 'Severe'   THEN 3
  END
  DESC;


  --6. Addiction Rate By Gender
SELECT
  gender,
  COUNT(*) AS total,
  SUM(addicted_label) AS addicted,
  ROUND(AVG(addicted_label) * 100, 1) AS addiction_rate_pct,
  ROUND(AVG(daily_screen_time_hours), 2) AS avg_screen_time
FROM vw_Smartphone_Analysis
GROUP BY gender
ORDER BY addiction_rate_pct DESC;

