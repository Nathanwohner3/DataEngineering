<!-- ABOUT THE PROJECT -->

## About The Project

Airbnb is one the most popular vacation housing rental websites in the world and serves as the premier alternative to hotel living all around the world.  Millions of travelers flock to this site daily to find affordable housing in all of the world's most popular travel destinations. When selecting an airbnb destination many travelers take into account many factors including the destination's lifestyle of the citizens that live there, the number of restaurants and activities the destination has to offer and much more.  This project's goal is utilize sample airbnb data and combine the data with happiness data and airport data and migrate them onto AWS. 

### Project Description

#### Scope the Project and Gather Data

In this project, we combine airbnb data, [Healthy Lifestyle](https://www.kaggle.com/datasets/prasertk/healthy-lifestyle-Healthy Lifestyle) data and airport data to explore whether there is any correlation between the above. The airbnb data is demo sample and the other two dataset are static in nature. The general idea of this project is to extract Airbnb data, analyze its sentiment and use the resulting data to gain insights with the other datasets. The idea is to provide in depth information on different destinations for airbnb users to utilize in determining where they would wish to visit.  For instance, we could answer interesting questions like whether 1 user would prefer to visit one destination based upon a whole host of factors including municipality's lifestyle rank, pollution index, number of restaurants, sunshine hours all the while pinpointing the nearest airport they would have to travel into to arrive at that particular destination. 

The entire process is orchestrated using Apache Airflow and is triggered automatically to run on daily schedule. The key tools used for this project AWS Redhift,  and AWS S3.





#### Explore and Assess the Data


A quick data exploration and quality assessment was done on the datasets using Jupyter notebook . The lifestyle and airport codes data set had relatively no issues with a sparing amount of NULL values but nothing to really affect quality of results when querying the two data sets. The data would clearly answer our burning questions of correlating lifestyle and airbnb travel. However, the Airbnb data set had a massive amount of missing values and no duplicates. To remedy this, empty records within the Airbnb Data set  were dropped before uploading to AWS S3. 


**DAG Operations**

The Airflow DAG is set up to execute the following steps sequentially.

1. Start execution as per schedule
2. Create the AWS Redshift cluster
3. Upload static datasets to AWS S3
4. Create tables on AWS Redshift
5. Stage the data from AWS S3 on AWS Redshift
6. Perform data quality check on the staging tables
7. Transform and load data into facts table 
8. Perform data quality check on the facts tables
9. Transform and load data into dimensional table 
10. Perform data quality check on the dimensional tables
11. Destroy the cluster
12. End execution



#### Run ETL to Model the Data

AWS S3 serves as a data lake storing our static and dynamic data for further processing. We then stage the airbnb data, lifestyle data and airport data on AWS Redshift and convert them to fact and dimensions tables (Star Schema) on AWS Redshift. This would allow us to answer insightful questions on the data and can be used for business analytics. 

Implementing the data stores and data warehouses on the cloud brings in lots of advantages. We can scale our resources vertically or horizontally as per our real time requirements with few clicks (or CLI commands).

##### Data quality checks

* Integrity checks

  The relational database has integrity checks in place with the use of PRIMARY KEYs in fact and dimensional tables. These keys ensure that these values are UNIQUE and NOT NULL. The tables for Happiness Index and Temperature data have NOT NULL constraints for their entries - since we have already explored them and made sure that they are not NULL. The LOCATION attribute in the tweets table has the NOT NULL constraint since we intend to use that field for analytics. We cannot be stringent about the NULL values in other attributes of the tweets table since the data is dynamic and may have missing values in fields we do not require in this project.

* Source/Count checks

  Source count checks have been implemented in the Airflow DAGs using the CheckOperator and ValueCheckOperator. Since we already know the number of entries in the static datasets we could use the ValueCheckOperator to check all the entries have been inserted. Since we don't know the entries for dynamic tweet data we could use the CheckOperator to check any entries have been made to the table.



### Tools and Technologies used

* [python](https://www.python.org/)

* [Apache Airflow](https://airflow.apache.org/) 

    Apache Airflow is an open-source tool for orchestrating complex computational workflows and data processing pipelines. It is a platform to programmatically author, schedule, and monitor workflows. When workflows are defined as code, they become more maintainable, versionable, testable, and collaborative. We use Airflow to author workflows as directed acyclic graphs (DAGs) of tasks. The Airflow scheduler executes your tasks on an array of workers while following the specified dependencies. Rich command line utilities make performing complex surgeries on DAGs a snap. The rich user interface makes it easy to visualize pipelines running in production, monitor progress, and troubleshoot issues when needed.

* [Amazon Web Services](https://aws.amazon.com/)



  * [AWS S3](https://aws.amazon.com/s3/)

    Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. This means that we can use it to store and protect any amount of data for a range of use cases, such as big data analytics. Amazon S3 is designed for high of durability, and stores data for millions of applications for companies all around the world. In this project, we use this tool to store our static and dynamic datasets - acting as a data lake for our data. 

  * [AWS Redshift](https://aws.amazon.com/redshift/)

    Amazon Redshift is the most popular and fastest cloud data warehouse. Redshift is a fully-managed petabyte-scale cloud based data warehouse product designed for large scale data set storage and analysis. It is also used to perform large scale database migrations. Redshift’s column-oriented database is designed to connect to SQL-based clients and business intelligence tools, making data available to users in real time. In this project, we use this tool to warehouse our data so that we could easily scale it when necessary. 

    

## Apache Airflow Orchestration 

### DAG Structure

The DAG parameters are set according to the following :

- The DAG does not have dependencies on past runs
- DAG has schedule interval set to daily
- On failure, the task are retried 3 times
- Retries happen every 5 minutes
- Catchup is turned off
- Email are not sent on retry




## What if ?

This section discusses strategies to deal with the following three key scenarios:

1. Data is increased 100x. 
2. Data pipeline is run on daily basis by 7 am every day.
3. Database needs to be accessed by 100+ users simultaneously.

#### 1. Data is increased 100x

In this project we have used scalable, fully managed cloud services to store and process our data throughout. As mentioned earlier, we can easily scale our resources vertically or horizontally with few clicks to tackle this scenario. Increased resources for AWS Redshift would allow us to load larger static datasets faster. 

#### 2. Data pipeline is run on a daily basis by 7 am every day

As the static datasets do not change on a daily basis,  the data is stored in AWS S3 partitioned by yearly/monthly/daily/hourly blocks. This makes it easy to run tasks in parallel DAGs with reduced data volume. Hence, the entire data could be processed within the stipulated time.

#### 3. Database needs to be accessed by 100+ users simultaneously

We are using cloud based services, which can be easily given access to the 100+ users. To improve the performance, we need more CPU resources with increased user count. Using a distributed database, we can to improve oour replications and partitioning to get faster query results for each user. If a group of users work on a specific subset of data or have an expensive query, we can also explore creating duplicate tables for them (if possible). 



## Project structure

Files in this repository:

|  File / Folder   |                         Description                          |
| :--------------: | :----------------------------------------------------------: |
|     airflow      | Folder at the root of the project, where DAGs and associated python scripts are stored |
|     datasets     | Folder at the root of the project, where static datasets are stored |
|      images      |  Folder at the root of the project, where images are stored  |
|       sql        | Folder at the root of the project, where SQL commands are stored |
|    config.cfg    |                  Sample configuration file                   |
| requirements.txt |             Python environment requirements file             |
|   DATADICT.md    | Data Dictionary file with explanation of attributes of tables |
|    README.md     |                         Readme file                          |



<!-- GETTING STARTED -->



### Prerequisites

These are the prerequisites to run the program.

* python 3.7
* Airbnb Account
* Static datasets (from Kaggle)
* AWS IAM credentials
* AWS Comprehend
* AWS Redhift
* Apache Airflow


### How to run

Follow the steps to extract and load the data into the data model.

1. Set up Apache Airflow

2. Navigate to `Capstone Project` folder

3. Install requirements by

   

4. Edit and fill in `config.cfg` as per requirements

5. Download the static datasets into [datasets](./datasets) directory

6. Trigger Airflow DAG ON

7. Verify the DAG execution by executing analytics tasks.
