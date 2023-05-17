#!/bin/bash

# Prevent the results from being paginated
export AWS_PAGER=

aws cloudformation describe-stacks --stack-name "quick-email" --region us-east-1 --query "Stacks[0].Outputs[?OutputKey == 'EmailTemplate'].OutputValue | [0]" --output text
