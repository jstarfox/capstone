#!/bin/bash
aws configure --access-key --region us-east-1 $AWS_ACCESS_KEY_ID \
--secret-key $AWS_SECRET_ACCESS_KEY \

aws ecr create-repository --repository-name jenkins-cicd 

