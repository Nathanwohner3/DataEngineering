INSERT INTO time ("Date", "Second", "Minute", "Hour", "Month", "Year", Weekday)

SELECT DISTINCT "Date",
       extract(second from "Date"),
       extract(minute from "Date"),
       extract(hour from "Date"),
       extract(month from "Date"),
       extract(year from "Date"),
       extract(dayofweek from "Date")
FROM staging_airbnb;