#!/bin/bash

# Assign the passed in arguments
pipelineDefinitionId=$1
subscriptionId=$2
resourceGroupName=$3
aksClusterName=$4

az account set --subscription $subscriptionId

# Get the credentials for the AKS cluster
az aks get-credentials --resource-group $resourceGroupName --name $aksClusterName

az aks update \
    --resource-group $resourceGroupName \
    --name $aksClusterName \
    --tags RemediationsPOCUpdate=true