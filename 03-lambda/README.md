# AWS Lambda

create lambda through aws-cli
```bash
# create role
aws iam create-role --role-name rolename --assume-role-policy-document file://trust-policy.json
# create function
aws lambda create-function --function-name lambda-name \
--zip-file fileb://lambda.zip --handler app.handler --runtime nodejs14.x \
--role arn:aws:iam::accountId:role/role-name --profile profile --region region
# invoke lambda function
aws lambda invoke --function-name funciton-name out --log-type Tail --region region --query 'LogResult' --output text | base64 -d
# delete role
aws iam delete-role --role-name seven-lambda-ex role-name
```
