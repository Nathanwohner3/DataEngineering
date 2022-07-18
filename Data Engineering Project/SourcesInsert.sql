INSERT into sources (Source, is_mobile, is_desktop)
SELECT DISTINCT source,
                CASE
                    WHEN source LIKE "%Android" OR device LIKE "%iPhone" THEN TRUE
                    ELSE FALSE
                END,
                CASE WHEN source LIKE "%Airbnb%" THEN TRUE
                     ELSE FALSE
                END
FROM staging_airbnb;