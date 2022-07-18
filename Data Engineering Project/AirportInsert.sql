INSERT INTO airports (Municipality, Name, Country, Region, Identifier)

    SELECT DISTINCT Municipality,
                    Name,
                    Country,
                    Region,
                    Identifier
            
    from staging_airports;