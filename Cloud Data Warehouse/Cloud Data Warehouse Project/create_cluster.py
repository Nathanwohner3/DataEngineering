import pandas as pd
import boto3
import json


# Create Redshift Cluster. 




try:
    response = redshift.create_cluster(        
        
        #HW
        
        ClusterType= dev_cluster_type,
        NodeType= dev_node_type,
        NumberOfNodes=int(dev_num_nodes),

        #Identifiers & Credentials
        
        DBName= dev_DB_NAME,
        ClusterIdentifier=dev_cluster_identifier,
        MasterUsername= dev_DB_USER,
        MasterUserPassword=dev_DB_PASSWORD,
        
        #Roles (for s3 access)
        
        IamRoles=[roleArn]  
    )
except Exception as e:
    print(e)
    
    
# Open an incoming TCP port to access the cluster ednpoint  
    try:
    vpc = ec2.Vpc(id=myClusterProps['VpcId'])
    defaultSg = list(vpc.security_groups.all())[0]
    print(defaultSg)
    defaultSg.authorize_ingress(
        GroupName=defaultSg.group_name,
        CidrIp='0.0.0.0/0',
        IpProtocol='TCP',
        FromPort=int(DWH_PORT),
        ToPort=int(DWH_PORT)
    )
except Exception as e:
    print(e)