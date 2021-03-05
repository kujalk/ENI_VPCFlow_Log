#Cloudwatch LogGroup
#IAM Role and Policy
#VPC FlowLog

data "aws_instance" "created-ec2" {
  instance_id = aws_instance.main.id
}

resource "aws_cloudwatch_log_group" "cloudloggroup" {
  name = var.cloudwatchlog_group
}

resource "aws_flow_log" "vpc_flow" {
  iam_role_arn    = aws_iam_role.vpcflow_role.arn
  log_destination = aws_cloudwatch_log_group.cloudloggroup.arn
  traffic_type    = "ALL"
  eni_id          = data.aws_instance.created-ec2.network_interface_id
  max_aggregation_interval = 60

  tags = {
      Name = "${var.EC2_Name}_VPC-FlowLog"
  }
}

resource "aws_iam_role" "vpcflow_role" {
  name = "VPCFlow_Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "vpcflow_policy" {
  name = "ENI_VPCFlow_Log"
  role = aws_iam_role.vpcflow_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

