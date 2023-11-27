#!/bin/bash

####################
# Author: Yamini
# Date: 27th-nov-23
#
# Version: v1
#
# This script will report the AWS resource usage
####################

set -x

# AWS S3
# AWS EC2
# AWS lambda
# AWS IAM users

# list s3 buckets
echo "list of aws s3 buckets"
aws s3 ls > resourceTracker

# list EC2 instances
echo "list of EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list lambda
echo "list of lambda functions"
aws lambda list-functions >> resourceTracker

# list IAM users
echo "list of IAM users"
aws iam list-users >> resourceTracker
