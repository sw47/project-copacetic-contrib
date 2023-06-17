#!/bin/bash

# Assign the passed in arguments
SubscriptionId=$1
ResourceGroupName=$2
AksClusterName=$3

az account set --subscription $SubscriptionId

# Get the credentials for the AKS cluster
az aks get-credentials --resource-group $ResourceGroupName --name $AksClusterName

az aks update \
    --resource-group $ResourceGroupName \
    --name $AksClusterName \
    --tags RemediationsPOCUpdate=true