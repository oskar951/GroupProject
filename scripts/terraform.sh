#!/usr/bin/env bash

cd ./Terraform

terraform init

TF_VAR_usr=${DB_USERNAME} TF_VAR_pswd=${DB_PASSWORD} terraform apply -auto-approve