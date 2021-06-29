


## CloudWatch Logs
appliation can send logs to CloudWatch using the SDK
CloudWatch can collect logs from:
- Elastic Beanstalk: collection of logs from applications
- ECS: collection from containers
- AWS Lambda: collection from function logs
- VPC Flow Logs: VPC specific logs
- API Gateway
- CloudTrail based on filter
- CloudWatch log agents: for example on EC2 mathines
- Route53: log DNS queries
CloudWatch Logs can go to:
- Batch exporter to S3 for archival
- Stream to ElasticSearch cluster for further analytics

Logs storage architecture
- Log groups: arbitray name, usually representing an application
- Log stream: instances within application / log files / containers

can define log expiration plolicies(never expire, 30days etc)
using cli can tial CloudWatch logs
to send logs to cloudwatch, make sure IAM permissions are correct
Security: encryption of logs using KMS at the Group Level

cloudwatch logs can use filter expressions
- eg find a specific IP inseide of a log
- metric filters can be used to trigger alarms

CloudWatch Logs Insights can be used to query logs and add queries to CloudWatch Dashboards

CloudWatch Logs for EC2
by default no logs from EC2 will go to CloudWatch, need to run a CloudWatch agent on EC2 to push logs files to CloudWatch

## CloudWatch Alarms
- alarms are used to trigger notifications for any metric
- Alarms can go to Auto Scaling, EC2 Actions, SNS notifications
- Alarm States:
    - OK
    - INSUFFICIENT_DATA
    - ALARM
- Period
    - Length of time in seconds to evaluate the metric
    - High resoulution custom metrics: can only chose 10sec or 30sec

