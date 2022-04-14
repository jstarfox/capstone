#!/bin/bash
aws configure --access-key AKIAVO33MFIKK2T7O3E3 \
--secret-key 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 --region us-east-1

aws ecr create-repository --repository-name jenkins-cicd 

