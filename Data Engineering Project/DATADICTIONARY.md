# Data dictionary

## About
This file contains an overview of the attributes (columns), types and descriptions for all tables used in the project.

### Tables

#### Staging Airbnb

| Column | Type | Description |
| --- | --- | --- |
| Airbnb_id | VARCHAR | ID of Airbnb|
| City | VARCHAR | Destination City of Airbnb |
| Municipality | VARCHAR | Destination Municipality of Airbnb |
| AirportName | VARCHAR | Airport Name within Municipality and City of Airbnb |
| Rank | INT | Lifestyle Ranking of City where Airbnb is located |
| Date | INT | Date Airbnb booked or searched for |
| SunshineHours | INT |Number of hours City or Municipality where Airbnb is located has Sunshine |
| OutdoorActivities | INT | Number of outdoor Activities in which City/Municipality where Airbnb is located has to offer |
| NumberOfTakeOutPlaces | INT | Number of Restaurants City/Municipality where Airbnb is located has to offer |
| PollutionIndex | DECIMAL | Amount of Pollution City/Municipality where Airbnb experiences|
| User_ID | VARCHAR | ID of Airbnb User |
| source | VARCHAR | Device/App used to book Airbnb, ex:  Android/iPhone,  Desktop, etc.|


#### Staging Lifestyles

| Column | Type | Description |
| --- | --- | --- |
| City | VARCHAR | Name of City |
| Rank | INT | Lifestyle Ranking of City where Airbnb is located |
| SunshineHours | INT | Number of hours City or Municipality where Airbnb is located has Sunshine|
| ObesityLevelsPercentage | DECIMAL | Obesity Rate of people living within City where AIRBNB is located |
| PollutionIndex | DECIMAL | Lower bound of confidence Interval for happiness score |
| AverageAnnualHoursWorked | DECIMAL | Contribution of economic situation to happiness score|
| HappinessLevels | DECIMAL | Contribution of family situation to happiness score|
| OutdoorActivities | DECIMAL | Contribution of life expectancy to happiness score|
| freedom | DECIMAL | Contribution of personal/collective freedom to happiness score|
| NumberOfTakeOutPlaces | DECIMAL | Contribution of corruption into situation to happiness score |
| MonthlyGymMembershipCostEuros | DECIMAL | Contribution of perceived generosity to happiness score|


#### Staging Airports

| Column | Type | Description |
| --- | --- | --- |
|Municipality | VARCHAR | Date when the temperature was recorded|
|Name | VARCHAR | Average temperature measured at recording date|
|Country | VARCHAR | 95% confidence interval around average temperature |
|Region | VARCHAR | Country where temperature was recorded|
|Identifier | VARCHAR | Country where temperature was recorded|

#### Users
| Column | Type | Description |
| --- | --- | --- |
| User_id | VARCHAR | ID of Airbnb User |
| name | VARCHAR | Actual name of Airbnb user, ex: "Nathan Wohner" |
| nickname | VARCHAR | Screen name of the Airbnb user, ex: @TimeTravelorsHusband |
| description | VARCHAR | Bio of the Airbnb user |
| location | VARCHAR | Location of Airbnb user, ex: France, Austria |
| creation_date | TIMESTAMP | Date when the Airbnb user was created |
| is_host | BOOL | Whether the user is an Airbnb host |
| is_guest | BOOL | Whether the user is an Airbnb guest |

#### Sources
| Column | Type | Description |
| --- | --- | --- |
|source_id | BIGINT | Auto-incrementing ID of sources|
|source | VARCHAR | Device/App used to book Airbnb, ex: Android/iPhone, Desktop, etc. |
|is_mobile | BOOL | Whether the source is a mobile device|
|is_desktop | BOOL | Whether the source is made by Airbnb|

#### Lifestyles
| Column | Type | Description |
| --- | --- | ---|
| City | VARCHAR | Name of the city aribnb is located |
| rank | INT | Lifestyle ranking within city airbnb is located |
| SunshineHours | INT | Number of day hours within city Airbnb is located |
| ObesityLevelsPercentage | DECIMAL | Obesity rate within city where Airbnb is located |
| PollutionIndex | DECIMAL | Pollution levels within city where Airbnb is located |
| AverageAnnualHoursWorked | INT | Average annual hours employees work in city where Airbnb is located |
| HappinessLevels | DECIMAL | Contribution of personal/collective freedom to happiness score |
| OutdoorActivities | INT | Contribution of corruption into situation to happiness score |
| NumberOfTakeOutPlaces | INT | Number of restaurants in city where Airbnb is located |
| MonthlyGymMembershipCostEuros | DECIMAL | Average cost of gym membership in City where Aribnb is located |

#### Airports
| Column | Type | Description |
| --- | --- | ---|
| Municipality | VARCHAR | Municipality of airport |
| Name | VARCHAR | Name of airport|
| Country | VARCHAR | Country of Airport|
| Region | VARCHAR | Region of Airport|
| Identifier | VARCHAR | Unique identifier of airport|

#### Time
| Column | Type | Description |
| --- | --- | ---|
| date | TIMESTAMP | Union of distinct TIMESTAMPs from user_date and tweet_date found in staging_tweets|
| second | INT | Second derived from date|
| minute | INT | Minute derived from date|
| hour | INT | Hour derived from date|
| month | VARCHAR | Month derived from date|
| year | INT | Year derived from date|
| weekday | VARCHAR | Weekday derived from date|

#### Airbnb
| Column | Type | Description |
| --- | --- | ---|
| Airbnb_id | VARCHAR | ID of tweet |
| City | VARCHAR | Sentiment of the tweet text as determined by AWS Comprehend (positive/neutral/negative) |
| Municipality | VARCHAR | Text of tweet |
| AirportName | IN | Number of times the tweet is marked as favorite by other Twitter users |
| Rank | INT | Lifestyle ranking within city airbnb is located |
| Date | TIMESTAMP | Date when tweet was created |
| SunshineHours | INT | Number of day hours within city Airbnb is located |
| OutdoorActivities | INT | Contribution of corruption into situation to happiness score |
| NumberOfTakeOutPlaces | INT | Number of restaurants in city where Airbnb is located |
| PollutionIndex | DECIMAL | Pollution levels within city where Airbnb is located |
| User_id | VARCHAR | ID of Airbnb User |
|source | VARCHAR | Device/App used to book Airbnb, ex: Android/iPhone, Desktop, etc. |
