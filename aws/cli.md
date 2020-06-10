AWS CLI – Useful Commands
=========================

CloudFormation
--------------

Create a stack with some parameters:

```
aws cloudformation create-stack --stack-name MyWPTestStack \
--template-url https://s3.us-west-2.amazonaws.com/cloudformation-templates-us-west-2/WordPress_Single_Instance.template \
--parameters ParameterKey=KeyName,ParameterValue=name_of_key \
ParameterKey=DBPassword,ParameterValue=very_secure_password \
ParameterKey=DBUser,ParameterValue=some_guy \
ParameterKey=DBRootPassword,ParameterValue=more_secure_password

```

Create a stack without parameters; different domain pattern for `template-url`:

```
aws cloudformation create-stack --stack-name SomeStackName \\
--template-url https://s3.amazonaws.com/some-bucket/SomeStackTemplate.json
```

S3
--

Two ways to list objects in a bucket:

`aws s3api list-objects --bucket some-bucket --encoding-type url`

`aws s3 ls s3://some-bucket`

Copy entire directory to an S3 bucket:

`aws s3 cp ./origin-directory s3://some-bucket --recursive`

Copy a single file to an S3 bucket:

`aws s3 cp ./origin-directory/CloudFormationUpdateTest.json s3://some-bucket/CloudFormationUpdateTest.json`

EC2
---

Get instances, display only image ID, tags, and state:

`aws ec2 describe-instances --query "Reservations[*].Instances[*].[ImageId,Tags[*],State]"`

Get key stored pairs:

`aws ec2 describe-key-pairs`
