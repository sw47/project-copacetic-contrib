#!/bin/bash

# Assign the passed in arguments
PipelineDefinitionId=$1
SubscriptionId=$2
ResourceGroupName=$3
AksClusterName=$4

az account set --subscription $SubscriptionId

# Get the credentials for the AKS cluster
az aks get-credentials --resource-group $ResourceGroupName --name $AksClusterName

az aks update \
    --resource-group $ResourceGroupName \
    --name $AksClusterName \
    --tags RemediationsPOCUpdate=true