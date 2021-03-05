VPC_CIDR              = "10.0.0.0/24"
VPC_Name              = "JanaDemo_VPC"
Subnet_Name           = "JanaDemo_PublicSubnet"
Subnet_CIDR           = "10.0.0.128/25"
IGW_Name              = "JanaDemo_IGW"
SecurityGroup_Name    = "JanaDemo_SecuriyGroup-1"
RouteTable_PublicName = "JanaDemo_PublicRT"
EC2_Name              = "JanaDemo_EC2"
EC2_Size              = "t2.micro"
AMI_ID                = "ami-015a6758451df3cb9"
HTML_Message          = "This is VPC Flow Log Demo Website for Terraform"
cloudwatchlog_group   = "demo_vpc_log"