#!/bin/bash

# Assign the passed in arguments
SubscriptionId=$1
ResourceGroupName=$2
AksClusterName=$3

az account set --subscription "f67cc918-f64f-4c3f-aa24-a855465f9d41"

# Get the credentials for the AKS cluster
az aks get-credentials --resource-group "rg-remedations" --name "aks-remedations-test"

az aks update \
    --resource-group "rg-remedations" \
    --name "aks-remedations-test" \
    --tags RemediationsPOCUpdate=true