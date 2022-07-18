INSERT INTO airbnb (Airbnb_id,
                    City,
                    Municipality,
                    AirportName,
                    Rank,
                    "Date",    
                    SunshineHours,
                    OutdoorActivities,
                    NumberOfTakeOutPlaces,
                    PollutionIndex,
                    User_Id,
                    Source)
SELECT t.Airbnb_id,
       l.City,
       t.Municipality,
       a.AirportName,
       t.Rank,
       t."Date",
       l.SunshineHours,
       l.OutdoorActivities,
       l.NumberofTakePlaces,
       l.PollutionIndex,
       u.User_ID,
       s.Source,
       
FROM staging_airbnb t
    LEFT JOIN lifestyles l
        ON t.Rank = l.Rank
    LEFT JOIN airports a
        ON t.Municipality = a.Municipality
    LEFT JOIN users u
        ON t.user_id = u.user_id
    LEFT JOIN airports a
        ON t.Municipality = a.Municipality
    LEFT JOIN sources s
        ON t.Source = s.source