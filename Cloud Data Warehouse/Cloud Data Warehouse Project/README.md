
<!-- PROJECT DESCRIPTION -->

## About The Project

Sparkify, a music startup wants to analyze the data they've been collecting on songs and user activity on their new music streaming application. 

They would like a data engineer to build an ETL pipeline that extracts their data from S3, stages them in Redshift, and transforms data into a set of dimensional tables for their analytics team to continue finding insights in what songs their users are listening to. The role of this project is to create a data warehouse on cloud (AWS Redshift) and build ETL pipeline for this analysis. 

### Project Description

In this project, the data engineer will build a data warehouse on AWS and build an ETL pipeline for a database hosted on Redshift.  The data is loaded from S3 buckets to staging tables on Redshift and modeled into fact and dimensions tables to perform analytics and obtain meaningful insights.

### Built With

* python
* AWS

### Dataset

#### Song Dataset

Each file in the dataset is in JSON format and contains meta-data about a song and the artist of that song. The dataset is hosted at S3 bucket `s3://udacity-dend/song_data`.

Sample Record :

```
{"num_songs": 1, "artist_id": "ARJIE2Y1187B994AB7", "artist_latitude": null, "artist_longitude": null, "artist_location": "", "artist_name": "Line Renaud", "song_id": "SOUPIRU12A6D4FA1E1", "title": "Der Kleine Dompfaff", "duration": 152.92036, "year": 0}
```

#### Log Dataset

These log files in JSON format simulate activity logs from a music streaming application based on specified configurations. The dataset is hosted at S3 bucket `s3://udacity-dend/log_data`.

Sample Record :

```
{"artist": null, "auth": "Logged In", "firstName": "Walter", "gender": "M", "itemInSession": 0, "lastName": "Frye", "length": null, "level": "free", "location": "San Francisco-Oakland-Hayward, CA", "method": "GET","page": "Home", "registration": 1540919166796.0, "sessionId": 38, "song": null, "status": 200, "ts": 1541105830796, "userAgent": "\"Mozilla\/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/36.0.1985.143 Safari\/537.36\"", "userId": "39"}
```


## Database Schema Design

### Data Model

The Star Database Schema (Fact and Dimension Schema) is used for data modeling in this ETL pipeline. There is one fact table containing all the metrics (facts) associated to each event (user actions), and four dimensions tables, containing associated information such as user name, artist name, song meta-data etc. This model enables to search the database schema with the minimum number of *SQL JOIN*s possible and enable fast read queries. The amount of data we need to analyze is not big enough to require big data solutions or NoSQL databases.

The data stored on S3 buckets is extracted to staging tables `staging_events` and `staging_songs` on Redshift. Then the data from these tables are transformed and inserted into the fact and dimensional tables. An entity relationship diagram (ERD) of the data model is given below. 


### Prerequisites

These are the prerequisites to run the program.

* python 3.7
* PostgreSQL
* AWS account
* psycopg2 python library
* boto3 python library

### Execution Instructions

1. Within AWS, create a new USER and password to access Redshift cluster and database(s)/Table(s) within cluster. 

2. Edit the `dwh.cfg` configuration file and fill in the AWS Access Key and Secret Key fields

3. Within create_clients.py, be sure to populate Key and Secret Credentials of new username created. Once file is edited with username's Key and Secret credentials, execute create_clients.py      executable within terminal. This creates clients for IAM, EC2, S3 and Redshift. 
                           Terminal Code: python create_clients.py

4. Within terminal, execute create_IAMRoles.py executable. This creates IAM Role policy and attaches new policy to new username created in step 1 on AWS. 
               Terminal Code: python create_IAMRoles.py

5. Within terminal, execute create_cluster.py executable. This creates Cluster on AWS. Wait about 5 minutes after running this executable to give AWS a chance to finish creating cluster.
               Terminal Code: python create_cluster.py


6.  Within Terminal, execute create_tables.py. This will clean up and create new tables within the new Redshift cluster. 
               Terminal Code: python create_tables.py
   

7.  Within Terminal, execute etl.py to run ETL to process and load data into AWS database tables within Redshift cluster.
               Terminal Code: python etl.py

### Cleanup Instructions

1. Within Terminal, execte cleanup.py. This deletes cluster, detaches and deletes IAM policy roles. 
