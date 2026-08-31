use FlightAnalysisDB;

SELECT COUNT(*) AS TotalRecords
FROM dbo.government_aviation_2024;

SELECT *
FROM dbo.government_aviation_2024;

--Government data basic overview
SELECT
    airline,
    total_scheduled_departures_2024_till_may,
    flights_cancelled_2024_till_may,
    ROUND(cancellation_rate_percent, 2) AS cancellation_rate_percent,
    ROUND(avg_otp_jan_may, 2) AS avg_otp_jan_may
FROM dbo.government_aviation_2024
ORDER BY total_scheduled_departures_2024_till_may DESC;

--IndiGo has the highest scheduled departures, highlighting its dominant operational scale, 
--while Akasa Air shows stronger OTP performance with a very low cancellation rate.


--Highest cancellation rate
SELECT
    airline,
    flights_cancelled_2024_till_may,
    ROUND(cancellation_rate_percent, 2) AS cancellation_rate_percent
FROM dbo.government_aviation_2024
ORDER BY cancellation_rate_percent DESC;

--Fly Big has the highest cancellation rate at 18.01%, while Akasa Air has the lowest at just 0.14%.

--OTP Ranking
SELECT
    airline,
    ROUND(avg_otp_jan_may, 2) AS avg_otp_jan_may
FROM dbo.government_aviation_2024
WHERE avg_otp_jan_may IS NOT NULL
ORDER BY avg_otp_jan_may DESC;

--Akasa Air has the highest average OTP at 80.86%, 
--while Alliance Air has the lowest at 51.22% among airlines with available OTP data.

--Cancellation vs OTP


SELECT
    airline,
    ROUND(cancellation_rate_percent, 2) AS cancellation_rate_percent,
    ROUND(avg_otp_jan_may, 2) AS avg_otp_jan_may
FROM dbo.government_aviation_2024
WHERE avg_otp_jan_may IS NOT NULL
ORDER BY avg_otp_jan_may DESC;

--Airlines with lower cancellation rates generally show better OTP performance.
--Akasa Air stands out with both the lowest cancellation rate (0.14%) and highest OTP (80.86%).

--Monthly OTP Analysis
SELECT
    airline,
    ROUND(otp_january, 2) AS January,
    ROUND(otp_february, 2) AS February,
    ROUND(otp_march, 2) AS March,
    ROUND(otp_april, 2) AS April,
    ROUND(otp_may, 2) AS May
FROM dbo.government_aviation_2024
WHERE otp_january IS NOT NULL
ORDER BY airline;

--OTP generally improved from January to March across most airlines, 
--while Akasa Air maintained the strongest performance and peaked at 89.2% in April.

--Highest OTP in Any Month
SELECT
    airline,
    ROUND(
        CASE
            WHEN otp_january >= otp_february
             AND otp_january >= otp_march
             AND otp_january >= otp_april
             AND otp_january >= otp_may
                THEN otp_january
            WHEN otp_february >= otp_january
             AND otp_february >= otp_march
             AND otp_february >= otp_april
             AND otp_february >= otp_may
                THEN otp_february
            WHEN otp_march >= otp_january
             AND otp_march >= otp_february
             AND otp_march >= otp_april
             AND otp_march >= otp_may
                THEN otp_march
            WHEN otp_april >= otp_january
             AND otp_april >= otp_february
             AND otp_april >= otp_march
             AND otp_april >= otp_may
                THEN otp_april
            ELSE otp_may
        END, 2
    ) AS best_otp
FROM dbo.government_aviation_2024
WHERE avg_otp_jan_may IS NOT NULL
ORDER BY best_otp DESC;

--Akasa Air achieved the highest monthly OTP of 89.2%, followed by Air Asia at 83%, highlighting strong peak on-time performance.

--Overall Government Performance Ranking
SELECT
    airline,
    ROUND(avg_otp_jan_may, 2) AS avg_otp_jan_may,
    ROUND(cancellation_rate_percent, 2) AS cancellation_rate_percent,
    CASE
        WHEN avg_otp_jan_may >= 75
             AND cancellation_rate_percent <= 1
            THEN 'Strong Performance'
        WHEN avg_otp_jan_may >= 65
             AND cancellation_rate_percent <= 2
            THEN 'Moderate Performance'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM dbo.government_aviation_2024
WHERE avg_otp_jan_may IS NOT NULL
ORDER BY avg_otp_jan_may DESC;

--Akasa Air is the only airline classified as Strong Performance, 
--combining the highest OTP with the lowest cancellation rate among airlines with available OTP data.

--Final Government SQL Summary
SELECT
    COUNT(*) AS total_airlines,
    SUM(total_scheduled_departures_2024_till_may) AS total_scheduled_flights,
    SUM(flights_cancelled_2024_till_may) AS total_cancelled_flights,
    ROUND(AVG(cancellation_rate_percent), 2) AS avg_cancellation_rate,
    ROUND(AVG(avg_otp_jan_may), 2) AS avg_otp
FROM dbo.government_aviation_2024;

--Final Business Insights
--1. Operational scale:
--   IndiGo has the largest operational scale, with 269,567 scheduled departures.

--2. Reliability:
--  Akasa Air shows the strongest reliability, with 80.86% average OTP and only 0.14% cancellation rate.

--3. Cancellation concern:
--  Fly Big has the highest cancellation rate at 18.01%, indicating a significant operational reliability issue.

--4. Overall performance:
--  Across the 12 airlines, the dataset records 456,919 scheduled flights with an average cancellation rate of 3.10%.