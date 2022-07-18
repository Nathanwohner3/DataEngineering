
<!--PROJECT -->

## Project Details

Sparkify, a music company wants to analyze data they've been collecting on songs and user activity on their new music streaming application. The analytics team is particularly interested in understanding what songs users are listening to. Currently, they don't have an easy way to query their data, which resides in a directory of JSON logs on user activity on the application, as well as a directory with JSON meta-data on the songs in their application.

They'd like a data engineer to create a Postgres database with tables designed to optimize queries on song play analysis. The role of this project is to create a database schema and ETL pipeline for this analysis. 

### Project Description

This project will summarize how to model the data with Postgres SQL database and build an ETL pipeline using Python.



#### Song Dataset
Each file in the dataset is in JSON format and contains meta-data about a song and the artist of that song. 

Sample Record :
```
{"num_songs": 1, "artist_id": "ARJIE2Y1187B994AB7", "artist_latitude": null, "artist_longitude": null, "artist_location": "", "artist_name": "Line Renaud", "song_id": "SOUPIRU12A6D4FA1E1", "title": "Der Kleine Dompfaff", "duration": 152.92036, "year": 0}
```

#### Log Dataset

These log files in JSON format simulate activity logs from a music streaming application.

Sample Record :
```
{"artist": null, "auth": "Logged In", "firstName": "Walter", "gender": "M", "itemInSession": 0, "lastName": "Frye", "length": null, "level": "free", "location": "San Francisco-Oakland-Hayward, CA", "method": "GET","page": "Home", "registration": 1540919166796.0, "sessionId": 38, "song": null, "status": 200, "ts": 1541105830796, "userAgent": "\"Mozilla\/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/36.0.1985.143 Safari\/537.36\"", "userId": "39"}
```



## Database Schema Design

##### Fact Table

**Song_plays** 

- songplay_id SERIAL PRIMARY KEY: **Unique identifier of each individual user's song plan**
- start_time TIMESTAMP NOT NULL REFERENCES time(start_time): **Start time of when user begins listening music**
- user_id INTEGER REFERENCES users(user_id): **User's unique id**
- level VARCHAR: **states whether user has a paid subscription or not.**
- song_id VARCHAR REFERENCES songs(song_id): **song's unique identifier.** 
- artist_id VARCHAR REFERENCES artists(artist_id): **Artist's unique identifier.**
- session_id INTEGER: **unique identifier of user's listening session.**
- location VARCHAR: **Location of user currently listening.**
- user_agent VARCHAR: **User's agent.** 


##### Dimension Tables

**songs**

- song_id VARCHAR PRIMARY KEY: **song's unique identifier.* 
- title VARCHAR NOT NULL: **song's title.**
- artist_id VARCHAR: **Artist's unique identifier**
- year INTEGER CHECK (year >= 0): **Year of song's release.**
- duration DECIMAL NOT NULL: **How long song last in duration.** 

**artist**

- artist_id VARCHAR PRIMARY KEY: **artist's unique identifier.**
- name VARCHAR NOT NULL: **Artist's name**
- location VARCHAR: **Location of user. **
- latitude DECIMAL: **latitude of user.**
- longitude DECIMAL: **longitude of user.**

**users**

- user_id INTEGER PRIMARY KEY: **user's unique identifier.**
- first_name VARCHAR NOT NULL: **user's first name.**
- last_name VARCHAR NOT NULL: **user's last name.**
- gender CHAR(1): **user's gender**.
- level VARCHAR: **user's subscription status.**


**time**

- start_time TIMESTAMP PRIMARY KEY: **time user begins listening to song**
- hour INTEGER NOT NULL CHECK (hour >= 0): **hour listener begins listening to song**
- day INTEGER NOT NULL CHECK (day >= 0): **day listener listened to song**
- week INTEGER NOT NULL CHECK (week >= 0): **week listener listened to song**
- month INTEGER NOT NULL CHECK (month >= 0): **month listener listened to song**
- year INTEGER NOT NULL CHECK (year >= 0): **year listener listened to song**
- weekday VARCHAR NOT NULL: **weekday listener listened to song. 

## Data Model ERD

The Star Database Schema used for data modeling in this ETL pipeline. There is one fact table containing all the metrics (facts) associated to each event (user actions), and four dimensions tables, containing associated information such as user name, artist name, song data. 



## Files

Files in this repository:

|  File / Folder   |                         Description                          |
| :--------------: | :----------------------------------------------------------: |
|       data       | Folder at the root of the project, where all song and log data JSONS reside |
|      images      |  Folder at the root of the project, where images are stored  |
|  sql_queries.py  |      Contains the SQL queries for data modeling and ETL      |
| create_tables.py |         Drops and creates tables. (Reset the tables)         |
|    test.ipynb    |                Exploring the database tables                 |
|    etl.ipynb     | Processes a file from song_data and log_data and loads the data into tables |
|      etl.py      | Processes all files from song_data and log_data and loads them into  tables |
|      README      |                         Readme file                          |

### Platforms

**python**
**PostgreSQL**
**iPython notebooks**


### Check list

Please be sure that your machine meets the following prerequisites prior to running the program.

**python 3.7**
**PostgreSQL**
**psycopg2 python library**


> Please note that you will be unable to run **test.ipynb**, **etl.ipynb**, or **etl.py** until you have run **create_tables.py** at least once to create the *sparkifydb* database, which these other files connect to. Remember to always close the connection to the database on exit. 

### Execution Instructions

Follow the steps to extract and load the data into the data model.

1. Navigate to `Project 1 Data Modeling with PostgreSQL` folder

2. Run `create_tables.py` to create/reset the tables by

   ```python
   python create_tables.py
   ```

3. Run ETL process and load data into database by 

   ```python
   python etl.py
   ```

4. Check whether the data has been loaded into database by executing queries in `test.ipynb`
