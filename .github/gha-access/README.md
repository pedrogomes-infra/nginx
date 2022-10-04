# nginx-gha-access

Creates AWS IAM user with necessary permissions and uploads the credentials to GitHub Actions secrets.

## Overview

- AWS CF stack - creates IAM user
- The ghaws module - uploads secrets to GHA

## Usage

### create/update

#### CF stack with IAM user

To create you need to run follows command:

```sh
npm run deploy [-- --aws-profile <AWS_ACCOUNT>]
```

This command will deploy CloudFormation stack with IAM user that has all needed permissions by GitHub Actions.
The IAM service is not bounded to any region, for that reason this stack creates global user `nginx-gha-access`.
The environment/stage and region are hardcoded (env: `global`, region: `us-east-1`) and must not be changed on deployment.
The permissions that are applied to the IAM user are working in every region and for any environment/stage.

#### Upload secret to GHA

```sh
npx ghaws -r nginx -a sandbox
```

### remove

```sh
npm run remove [-- --aws-profile <AWS_ACCOUNT>]
```