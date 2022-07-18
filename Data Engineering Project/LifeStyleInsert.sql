INSERT INTO lifestyles (City, Rank, SunshineHours, ObesityLevelsPercentage, PollutionIndex, AverageAnnualHoursWorked,
HappinessLevels, OutdoorActivities, NumberOfTakeOutPlaces, MonthlyGymMembershipCostEuros)

SELECT DISTINCT City, 
                Rank, 
                SunshineHours, 
                ObesityLevelsPercentage, 
                PollutionIndex, 
                AverageAnnualHoursWorked,
                HappinessLevels, 
                OutdoorActivities, 
                NumberOfTakeOutPlaces, 
                MonthlyGymMembershipCostEuro
                
FROM staging_lifestyles;