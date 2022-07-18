import pandas as pd
import boto3
import json


# Create clients for IAM, EC2, S3 and Redshift. 

ec2 = boto3.resource('ec2',
                       region_name="us-west-2",
                       aws_access_key_id= *************,
                       aws_secret_access_key= ***********
                    )

s3 = boto3.resource('s3',
                       region_name="us-west-2",
                       aws_access_key_id= *************,
                       aws_secret_access_key= *************
                   )

iam = boto3.client('iam',aws_access_key_id= *************,
                     aws_secret_access_key= *************,
                     region_name='us-west-2'
                  )

redshift = boto3.client('redshift',
                       region_name="us-west-2",
                       aws_access_key_id= *************,
                       aws_secret_access_key= *************
                       )
