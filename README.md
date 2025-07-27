# aws-service-lister-project

# 🛠️ AWS Service Lister (Shell Scripting)

This is a simple shell script that allows you to list AWS resources in a given region. It supports 15+ AWS services like EC2, S3, RDS, Lambda, CloudFront, and more.

🔍 Features

- Lists resources for the following services:
  - EC2
  - S3
  - RDS
  - Lambda
  - CloudFront
  - EBS, ELB
  - CloudWatch
  - SNS, SQS 
  - DynamoDB
  - Route53
  - VPC, IAM
  - CloudFormation
 
⚙️ Prerequisites:
Before running this script, make sure the following are set up: 

✅ AWS CLI installed on your terminal
✅ AWS CLI configured with valid credentials

## 🚀 Usage & Example below:

Bash command:
./aws_service_lister.sh <region> <service>
Example:
./aws_service_lister.sh us-east-1 ec2

Sample Output for EC2:
---------------------------------------------------------
|         DescribeInstances in us-west-2 region         |
---------------------------------------------------------
| Instance ID | State   | Type      | Public IP | Private IP |
|-------------|---------|-----------|-----------|------------|
| i-123456abc | running | t2.micro  | 18.1.2.3  | 10.0.0.1   |

📌 Notes

If the script prints an error, check:

AWS CLI is installed and accessible via terminal

AWS credentials are configured (~/.aws/credentials)

Correct region and service name are provided

Your IAM user/role has the required permissions

You can extend this script by:

Adding more services (like EKS, CloudTrail, etc.)

Supporting --help flag or a menu interface

Outputting to CSV/JSON/log file for automation

**************************************************************

🙋‍♂️Author
👨‍💻Sanjaykanth M
DevOps & Cloud Enthusiast | Shell Scripting Explorer 🌐
This project is inspired by a Devops content creator - Abishesh vermalla and enhanced with personal improvements to deepen hands-on experience with AWS and automation.



