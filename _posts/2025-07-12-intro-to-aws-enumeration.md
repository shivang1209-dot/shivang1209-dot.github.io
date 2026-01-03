---
layout: post
permalink: /posts/AWS-Security/intro-to-aws-enumeration
title: "Introduction to AWS Enumeration"
date: 2025-08-11 23:22
tags: AWS, AWSCLI, Enumeration
description: "Introduction to AWS Enumeration"
---

# Introduction to AWS Enumeration

## What is the AWS CLI?

CLI stands for `Command Line Interface`, which is a fancy term for software that lets you type in commands through your terminal. The [AWS CLI](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html#cli-aws) gives us the ability to make calls to the AWS API for all of their services that support it (which is most services). So instead of having to log into the AWS console and manually click around to configure services or launch resources, we can do all of that simply by using our keyboard, a terminal, and the AWS CLI.

For example, if you want to create a new user in AWS through the IAM (Identity and Access Management) service, you could do that by entering an AWS CLI command that looks like this into your computer’s terminal:

> aws iam create-user --user-name cybrisfun

### Benefits of using the CLI

1. When you don’t have console access

The first reason is whenever you don’t have access to the console. This can be fairly common when performing security assessments in the cloud since. Perhaps the credentials that you were given to test don’t provide console access, or the credentials you may have found through security research could be credentials that don’t provide access to the console by design.

2. Remote access

When you become more comfortable with using the CLI, you will find that some steps are far more efficient and easier than through the console. The console will require you to:

- Open a browser window and navigate to AWS
- Log in using username/password + MFA
- Search for the service you need
- Click around until you find the page you need
- Do what you wanted to do

With the CLI, that could be cut down to:

- Find the CLI command you need (a quick Google search or go to the docs)
- Issue the command or series of commands you need

That’s it.

### Finding profiles on your local machine

When we configure the AWS CLI, it stores your information in a config file and a credentials file. Let’s take a look.

```bash
vim ~/.aws/config
```
And you should see your profile, kind of like this:

```js
[default]
region = us-east-1
output = json
```
This is how the CLI keeps track of your various profiles.

Then, you can do the same thing but with this file:

```bash
vim ~/.aws/credentials
```
It should look something like this:
```js
[default]
aws_access_key_id = AKIA5...
aws_secret_access_key = guI6...
```

### Issuing CLI commands

To List the STS identity - 
```bash
❯ aws sts get-caller-identity

{
    "UserId": "AIDAT6ZKEI3ES3ICKMUQ7",
    "Account": "272281913033",
    "Arn": "arn:aws:iam::272281913033:user/cli-getting-started-Dana"
}
```
This is essentially the “whoami” in AWS because it returns basic information about who you are based on the credentials used.

Next, run this command to list out our role ARN: (role name is case sensitive!)
```bash
❯ aws iam list-roles --query "Roles[?RoleName=='AWSCLIRole']"
```

### How to use roles with the AWS CLI

Roles are different from users because they `don’t use long-term access keys`. They use `short term credentials`.

Now that we know the role ARN, go back to your config file. We’re going to edit this file, so I recommend using whatever text editor you’re comfortable with, not necessarily vim. It could even be Notepad if you want:

```bash
nano ~/.aws/config
```
From there, you’ll see your existing profiles. Below those, we need to add a new profile like this:
```js
[profile AWSCLIRole]
role_arn = arn:aws:iam::014498641567:role/AWSCLIRole
source_profile = default
```
Now, we can issue commands through the role, and the AWS CLI will automatically handle authentication to assume the role for that call by using the profile name:

```bash
❯ aws sts get-caller-identity --profile AWSCLIRole
```
```js
{
    "UserId": "AROAQGYBPW2PSLOZOXJJE:botocore-session-1754936310",
    "Account": "014498641567",
    "Arn": "arn:aws:sts::014498641567:assumed-role/AWSCLIRole/botocore-session-1754936310"
}
```
You can see from this result that we are issuing commands as a role `(:assumed-role/AWSCLIRole)` and not as a user unlike earlier `(which looked like this: ":user/cli-getting-started-Dana")`, which means this worked! We can now use this AWS CLI profile in order to temporarily assume that role’s permissions instead of our user’s permissions.

This role has access to a file in Amazon S3 that we can only access by assuming it, and we can demonstrate that with:

```bash
❯ aws s3api list-buckets --profile AWSCLIRole
``` 
```js
{
    "Buckets": [
        {
            "Name": "cybr-data-bucket-014498641567",
            "CreationDate": "2025-08-11T17:48:49+00:00"
        }
    ],
    "Owner": {
        "ID": "5da48439e6ad72b421ee332cda273534712a3aec90de196b3c22fe2bed83ef32"
    },
    "Prefix": null
}
```
Versus if we try do to that with the --profile as our user:
```bash
❯ aws s3api list-buckets                     
```
```js
An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied
```

