variable "VPC_CIDR" {
  type    = string
  default = ""
}

variable "VPC_Name" {
  type    = string
  default = ""
}

variable "Subnet_Name" {
  type    = string
  default = ""
}

variable "Subnet_CIDR" {
  type    = string
  default = ""
}

variable "IGW_Name" {
  type    = string
  default = ""
}

variable "SecurityGroup_Name" {
  type    = string
  default = ""
}

variable "EC2_Name" {
  type    = string
  default = ""
}

variable "EC2_Size" {
  type    = string
  default = ""
}

variable "AMI_ID" {
  type    = string
  default = ""
}

variable "HTML_Message" {
  type    = string
  default = ""
}

variable "RouteTable_PublicName" {
  type    = string
  default = ""
}

variable "cloudwatchlog_group" {
  type    = string
  default = ""
}
#HTML script
locals {
  html_install = <<EOF
    #!/bin/bash

    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "${var.HTML_Message}" > var/www/html/index.html 
    
    EOF
}