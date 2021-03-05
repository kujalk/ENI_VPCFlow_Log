# ENI_VPCFlow_Log
Automate ENI VPC Flow Log with a EC2 Web Server using Terraform

This Terraform template, creates following resources,
•	EC2 instance
•	VPC with security group
•	Route table
•	Internet Gateway
•	VPC Flow Log for ENI of EC2 instance
•	CloudWatch Log group
•	IAM Role and Policy required to publish logs to CloudWatch

EC2 instance will be created in the custom VPC and VPC Flow log will be applied for the network interface (ENI) of that EC2 instance. 
The flow logs will be published to CloudWatch Logs. For this, appropriate IAM Policy and Role also will be created and applied to the EC2 instance. With this, you can able to monitor the network interface for traffic.
Apache web server will be installed in the EC2 instance and security group for ingress [port 80 and port 22] will be allowed. Further, VPC Flow Log aggregation interval is set to 1 minute.

