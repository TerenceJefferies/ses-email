# SES Email

## Description

This project is a small example of how to send an email using AWS SES. It contains a
cloudformation YAML template to create a simple newsletter signup email template as well
as a node script to invoke the email.

## Try it yourself

### Prerequisites

1. A configured AWS CLI
2. NodeJS installed
3. 2 verified email address in AWS SES, one for the `from` address, one for the `to` address

### Deploy the Cloudformation template

1. Open a terminal and navigate to the root of this project
2. Run `sh ./provision.sh`
3. Wait for the stack to be created

### Send the email

1. Open a terminal and navigate to the root of this project
2. Run `npm ci`
3. Run `sh ./run -f [from address] -t [to address] -n [name of recipient]`

### Cleanup

1. Open a terminal and navigate to the root of this project
2. Run `sh ./destroy.sh`

## Project setup

### Cloudformation

The cloudformation template creates a basic newsletter welcome email template. Including 
a name parameter to show how to pass parameters to a template.

To keep everything as self-contained as possible, the cloudformation template outputs 
the name of the created email template for use with the node script.

**Note:** This project assumes the `us-east-1` region for ease of demonstration.

### NodeJS

A basic node application has been provided to show how an application could interact with SES
to send an email using the provisioned template.
