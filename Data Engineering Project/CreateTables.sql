-- staging tables
CREATE TABLE IF NOT EXISTS public.staging_airbnb (
    Airbnb_id varchar(256),
    City varchar(256),
    Municipality varchar (256),
    AirportName varchar (256),
    Rank int,
    "Date" timestamp,    
    SunshineHours int,
    OutdoorActivities int,
    NumberOfTakeOutPlaces int,
    PollutionIndex decimal,
    User_Id varchar,
    Source varchar(256)
    );

CREATE TABLE IF NOT EXISTS public.staging_lifestyles (
    City varchar(256),
    Rank int,
    SunshineHours int,
    ObesityLevelsPercentage decimal,
    PollutionIndex decimal,
    AverageAnnualHoursWorked int,
    HappinessLevels decimal,
    OutdoorActivities int,
    NumberOfTakeOutPlaces int,
    MonthlyGymMembershipCostEuros decimal
);

CREATE TABLE IF NOT EXISTS public.staging_airports (
    Municipality varchar (256),
    Name varchar (256),
    Country varchar (256),
    Region varchar(256),
    Identifier varchar (256)
);

-- dimension tables
CREATE TABLE IF NOT EXISTS public.users (
    User_id varchar(256) NOT NULL,
    Name varchar(256),
    Nickname varchar(256),
    Description varchar(256),
    Location varchar(256) NOT NULL,
    Creation_date timestamp,
    Is_host bool,
    Is_guest bool,
    CONSTRAINT users.pkey PRIMARY KEY (User_id)
);

CREATE TABLE IF NOT EXISTS public.sources (
    Source_id bigint identity(0, 1),
    Source varchar(256),
    is_mobile bool,
    is_desktop bool,
    CONSTRAINT sources.pkey PRIMARY KEY (Source_id)
);

CREATE TABLE IF NOT EXISTS public.lifestyles (
    City varchar(256) NOT NULL,
    Rank int NOT NULL,
    SunshineHours int NOT NULL,
    ObesityLevelsPercentage decimal NOT NULL,
    PollutionIndex decimal NOT NULL,
    AverageAnnualHoursWorked int NOT NULL,
    HappinessLevels decimal NOT NULL,
    OutdoorActivities int NOT NULL,
    NumberOfTakeOutPlaces int NOT NULL,
    MonthlyGymMembershipCostEuros decimal NOT NULL,
    CONSTRAINT happiness.pkey PRIMARY KEY (Rank)
);

CREATE TABLE IF NOT EXISTS public.aiports (
    Municipality varchar(256) NOT NULL,
    Name varchar (256) NOT NULL,
    Country varchar (256) NOT NULL,
    Region varchar(256) NOT NULL,
    Identifier varchar (256)
    CONSTRAINT temperature.pkey PRIMARY KEY (Municipality)
);

CREATE TABLE IF NOT EXISTS public."time" (
    "Date" timestamp NOT NULL,
    "Second" int4,
    "Minute" int4,
    "Hour" int4,
    "Month" varchar(256),
    "Year" int4,
    Weekday varchar(256),
    CONSTRAINT time_pkey PRIMARY KEY (date)
);

-- fact table
CREATE TABLE IF NOT EXISTS public.airbnb (
    Airbnb_id varchar(256),
    City varchar(256),
    Municipality varchar (256),
    AirportName varchar (256),
    Rank int,
    "Date" timestamp,    
    SunshineHours int,
    OutdoorActivities int,
    NumberOfTakeOutPlaces int,
    PollutionIndex decimal,
    User_Id varchar,
    Source varchar(256)
    CONSTRAINT tweets.pkey PRIMARY KEY (Airbnb_id)
);