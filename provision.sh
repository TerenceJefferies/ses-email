#!/bin/bash

aws cloudformation create-stack --stack-name "quick-email" --template-body file://template.yml --region us-east-1
