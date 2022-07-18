INSERT INTO users (user_id)
    SELECT DISTINCT user_id
                    
    FROM staging_airbnb;