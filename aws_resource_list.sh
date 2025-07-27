#!/bin/bash
###################################################################
# This script lists all AWS resources in the specified region.
#Author: Sanjaykanth / Devops team
#Version: v0.0.1
#Following are the supported AWS services by the script:
# 1. EC2 Instances
# 2. S3 Buckets
# 3. RDS Instances
# 4. Lambda Functions
# 5. EBS
# 6. ELB
# 7. CloudFront
# 8. Cloudwatch
# 9. SNS
# 10. SQS
# 11. DynamoDB
# 12. Route53
# 13. VPC  
# 14. CloudFormation
# 15. IAM Roles

#Usage: ./aws_resource_list.sh <region> <service>

#Example: ./aws_resource_list.sh us-west-2 ec2

####################################################################

#Check if the required number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <region> <service>"
    echo "Example: $0 us-west-2 ec2"
    exit 1
fi 

# Assign the arguments to variables and convert the service to lowercase

aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]') 

#Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
fi

#Checks if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure it using 'aws configure' and try again."
    exit 1
fi

#Execute the AWS CLI command based on the service name

case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region \
            --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress,PrivateIpAddress]' \
            --output table

        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region \
            --query 'Buckets[*].Name' \
            --output table
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region \
            --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus]' \
            --output table
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region \
            --query 'Functions[*].[FunctionName,Runtime,State,LastModified]' \
            --output table
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region \
            --query 'Volumes[*].[VolumeId,State,Size,VolumeType,AvailabilityZone]' \
            --output table
        ;;
    elb)
        echo "Listing ELB Load Balancers in $aws_region"
        aws elb describe-load-balancers --region $aws_region \
            --query 'LoadBalancerDescriptions[*].[LoadBalancerName,DNSName,CreatedTime,AvailabilityZones]' \
            --output table
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $aws_region \
            --query 'DistributionList.Items[*].[Id,Status,DomainName,LastModifiedTime]' \
            --output table
        ;;
    cloudwatch)
        echo "Listing CloudWatch Metrics in $aws_region"
        aws cloudwatch list-metrics --region $aws_region \
            --query 'Metrics[*].[Namespace,MetricName,Dimensions]' \
            --output table
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region \
            --query 'Topics[*].TopicArn' \
            --output table
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region \
            --query 'QueueUrls[*]' \
            --output table
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region \
            --query 'TableNames[*]' \
            --output table
        ;;
    route53)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region \
            --query 'HostedZones[*].[Id,Name,Config.PrivateZone]' \
            --output table
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region \
            --query 'Vpcs[*].[VpcId,State,CidrBlock,IsDefault]' \
            --output table
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation list-stacks --region $aws_region \
            --query 'StackSummaries[*].[StackName,StackStatus,CreationTime]' \
            --output table
        ;;
    iam)
        echo "Listing IAM Roles in $aws_region"
        aws iam list-roles --region $aws_region \
            --query 'Roles[*].[RoleName,RoleId,Arn,CreateDate]' \
            --output table
        ;;
    *)
        echo "Invalid server. Please provide a valid service name."
        exit 1
        ;;
esac

