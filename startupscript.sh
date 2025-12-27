#!/bin/bash
echo "Setting Role"
export AWS_PROFILE=tf-persona
aws sts get-caller-identity
