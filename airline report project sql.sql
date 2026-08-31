create database FlightAnalysisDB;
use FlightAnalysisDB;
SELECT DB_NAME() AS CurrentDatabase;

select COUNT(*) as TotalRecords from dbo.indian_airline_cleaned;
select Top 10 * from dbo.indian_airline_cleaned;

--Airline-wise Scheduled Flights
select airline, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by airline
    order by total_schedules desc;

--"The analysis shows that IndiGo has a significantly higher number of scheduled flights than other airlines, 
--indicating strong network presence and operational scale".

--Top 10 Origin Airports.
select Top 10
    origin, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by origin
    order by total_schedules desc;
  
--Mumbai is the busiest origin airport with 2,910 scheduled flights, followed by Delhi and Bengaluru.

--Top 10 Destination Airports.
select Top 10
    destination, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by destination
    order by total_schedules desc;

--Delhi is the top destination with 5,462 scheduled flights, significantly ahead of Mumbai and Bengaluru.

--Top 10 Routes
select Top 10
    origin,
    destination, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by origin,destination
    order by total_schedules desc;

--Srinagar → Delhi is the busiest route with 470 scheduled flights, followed by Mumbai → Delhi with 354.

--Airline × Route
select Top 15
    airline,
    origin,
    destination, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by airline,origin,destination
    order by total_schedules desc;

--IndiGo dominates the busiest airline-route combinations, especially Srinagar–Delhi and Jammu–Srinagar.

--Departure Period Analysis
select departurePeriod, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by departurePeriod
    order by total_schedules desc;
   
--Afternoon has the highest number of scheduled flights, followed by morning, making daytime operations dominant.

--Airline × Departure Period
select airline, 
    departurePeriod, 
    count(*) as total_schedules
    from dbo.indian_airline_cleaned
    group by airline,departurePeriod
    order by airline, total_schedules desc;

--Most airlines have their highest scheduled-flight volume in the afternoon, followed by morning operations.

--Average Flight Duration by Airline
select airline, 
    Round(avg([flight_duration_minutes]),2) as average_flight_duration
    from dbo.indian_airline_cleaned
    group by airline
    order by average_flight_duration desc;

--Vistara has the highest average flight duration (131.68 min), while FlyBig has the lowest (105.34 min).

--Operating Days Analysis
select airline, 
    Round(avg([operatingdaysperweek]),2) as avg_operating_days
    from dbo.indian_airline_cleaned
    group by airline
    order by avg_operating_days desc;

--Jetlite, SpiceJet aur Vistara average 6 days/week operate karte hain, while Star Air operates only around 3 days/week.

--Top 10 Longest Flights
select Top 10
    airline,
    flightNumber,
    origin,
    destination, 
    [flight_duration_minutes]
from dbo.indian_airline_cleaned
order by [flight_duration_minutes] desc;

--Several flights show unusually high scheduled durations of around 24 hours, 
--indicating potential data-quality or schedule-format issues that should be validated.

--data quality validation
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN [flight_duration_minutes] = 0 THEN 1 ELSE 0 END) AS zero_duration_flights,
    SUM(CASE WHEN [flight_duration_minutes] > 600 THEN 1 ELSE 0 END) AS very_long_flights,
    SUM(CASE WHEN [flight_duration_minutes] < 0 THEN 1 ELSE 0 END) AS negative_duration_flights
FROM dbo.indian_airline_cleaned;

--Data has no negative-duration records, but 248 unusually long flights and 16 zero-duration flights require validation.




