# Django Terraform App

There is a live deployment of this project on in the https://5woft2ys6b.execute-api.us-east-1.amazonaws.com/prod 

----

### Prerequisites
You're going to need to setup some things before start:
1. First of all, you need to setup your `~/.aws/credentials` to have the credentials that are going to be used to create the infrastructure.
2. In the file `infra/main.tf`, look for app_name and set the name of your app.

### Quickstart

To create the initial cloud infrastructure:

```
cd infra
terraform init
terraform apply
```
This will create a S3 bucket to serve static files and a RDS instance to store the data.
Here you will need to get the URL to that database and set the following environment variables in a .env file that will live in the root directory: DB_NAME, DB_HOST, DB_PORT, DB_USER AND DB_PASSWORD.

Then we can deploy our app using zappa. Go back to the project root directory and run:

```
zappa deploy prod
```

Now we have a RDS instance, but we need to create the database and run the migrations:

```
zappa manage prod create_db
zappa manage prod migrate
```

Visit the URL returned by zappa to access your application.