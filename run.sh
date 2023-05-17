#!/bin/bash

while getopts "f:t:n:" flag
do
  case "${flag}" in
    f) from=${OPTARG};;
    t) to=${OPTARG};;
    n) name=${OPTARG};;
    *) echo "Invalid flag ${flag}" && exit 1;;
  esac
done

if [ -z "$from" ] || [ -z "$to" ] || [ -z "$name" ]
then
  echo "Missing arguments"
  exit 1
fi

node send-email.js "$(sh ./get-template.sh)" "$from" "$to" "$name"
