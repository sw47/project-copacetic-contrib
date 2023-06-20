#!/bin/bash
PipelineId="322334"

az login

az account set --subscription "f67cc918-f64f-4c3f-aa24-a855465f9d41"

# Define the pipeline parameters
#body="{\"definition\": {\"id\": $PipelineId}}"
# Invoke the REST API
#pat=$(az keyvault secret show --id "https://remediationskv.vault.azure.net/secrets/DylanPat" --query "value" -o "tsv")
#az rest --method post --uri "https://dev.azure.com/msazure/one/_apis/build/builds?api-version=6.1-preview.6" --body "$body" --headers "Content-Type=application/json" "Authorization=Basic $(echo -n ":$pat" | base64)"

# Invoke the REST API

# Assign the passed in arguments
# SubscriptionId=$1
# ResourceGroupName=$2
# AksClusterName=$3


# # Get the credentials for the AKS cluster
az aks get-credentials --resource-group "rg-remedations" --name "aks-remedations-test"

#!/bin/bash

# Set your parameters here
ACR_NAME=crremediations
IMAGE_NAME=nginx

# Get the latest tag
LATEST_TAG=$(az acr repository show-tags --name $ACR_NAME --repository $IMAGE_NAME --orderby time_desc --top 1 -o "tsv")
echo "crremediations.azurecr.io/nginx:$LATEST_TAG"
#kubectl set image deployment/nginx-deployment nginx=crremediations.azurecr.io/nginx:$LATEST_TAG

#echo $LATEST_TAG

# az aks update --resource-group "rg-remedations" --name "aks-remedations-test" --tags "RemediationsPOCUpdate=true"