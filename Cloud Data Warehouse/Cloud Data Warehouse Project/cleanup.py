import pandas as pd
import boto3
import json


# Delete Cluster

redshift.delete_cluster( ClusterIdentifier=dev_CLUSTER_IDENTIFIER,  SkipFinalClusterSnapshot=True)


# Detach and delete role

iam.detach_role_policy(RoleName=dev_IAM_ROLE_NAME, PolicyArn="arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess")
iam.delete_role(RoleName=dev_IAM_ROLE_NAME)

