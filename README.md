# aws-s3-website-template
A template project that contains the basics for deploying and managing a public website hosted in AWS S3


## Create the stack and S3 bucket

Navigate to the infra directory  
`cd infra`  

Run the script
`bash deployInfra.sh`  

When prompted *Specify if you want to update or create this stack (update/create)* specify `create`.

If the stack is created successfully you will receive an output containing the `StackId`
```json
{
    "StackId": "arn:aws:cloudformation....."
}
```

Go the CloudFormation in the AWS console to verify if the stack created your resources successfully.

OR

Run this to check all if your bucket exists
```
aws s3api list-buckets --query "Buckets[].Name" --profile your-aws-profile --region us-east-1
```

## Deploy the website to S3

Navigate to the infra directory  
`cd infra`  

Run the script
`bash deployContent.sh`  

You should see some upload logs if everything is going well.
```
Sync S3 bucket starting... 
upload: ../src/error.html to s3://my-s3-bucket-website-demo/error.html
upload: ../src/index.html to s3://my-s3-bucket-website-demo/index.html
Sync S3 bucket completed... 
```

## View the website

http://my-s3-bucket-website-demo.s3-website-us-east-1.amazonaws.com/