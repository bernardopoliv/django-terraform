# Django Terraform App

There is a live deployment of this project on in the https://5woft2ys6b.execute-api.us-east-1.amazonaws.com/prod 

----

### Quickstart

1. To create the infrastructure for your project:

```
cd infra
terraform init
terraform apply
```

This will create a S3 bucket to serve static files and a RDS instance to store the data.

2. Then we can deploy our app using zappa. Go back to the project root directory and run:

```
zappa deploy prod
```

3. Run `zappa manage prod migrate` to create the polls models.

5. Visit the URL returned by zappa to access your application.