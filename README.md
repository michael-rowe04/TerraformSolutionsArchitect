# TerraformSolutionsArchitect
Terraform IaC for Solutions Architect Exam Practice


## Startup

##
Create the User in AWS which you will use on your local CLI. Set up the persona as such:
```
aws configure --profile terraform-sandbox-user
```
You will be prompted to paste your access tokens which are gotten from the AWS Console.

Then set your session to use that persona:
```
export AWS_PROFILE=terraform-sandbox-user
```

When first starting you will need to assume into the terraform deployment role like as such:

```
export $(aws sts assume-role \
  --role-arn arn:aws:iam::816131439405:role/tf-deployment-sandbox-role \
  --role-session-name tf-sandbox \
  --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
  --output text | awk '{print "AWS_ACCESS_KEY_ID="$1"\nAWS_SECRET_ACCESS_KEY="$2"\nAWS_SESSION_TOKEN="$3}')
```

Just because the Backend uses your current session credentials (which is the user) and that doesnt have access to set up the backend.
