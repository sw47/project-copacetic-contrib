# Invoke the REST API - TODO: parameterize the image name in the pipeline
body="{\"definition\": {\"id\": $PipelineId}}"

# TODO - use OAuth to get access to user authorized pipelines
pat=$(az keyvault secret show --id "https://remediationskv.vault.azure.net/secrets/DylanPat" --query "value" -o "tsv")
az rest --method post --uri "https://dev.azure.com/msazure/one/_apis/build/builds?api-version=6.1-preview.6" --body "$body" --headers "Content-Type=application/json" "Authorization=Basic $(echo -n ":$pat" | base64)"

# Wait 20 minutes for new image to be pushed - TODO: poll for ADO status change in the future
#sleep 1200

az account set --subscription $SubscriptionId

az aks get-credentials --resource-group $ResourceGroupName --name $AksClusterName

az aks update --resource-group $ResourceGroupName --name $AksClusterName --tags RemediationsPOCUpdate=true

# TODO - first check if it exists, install if not
az aks install-cli --only-show-errors

# TOOD - check first access to ACR access
az aks update -n $AksClusterName -g $ResourceGroupName --attach-acr "crremediations" 2>/dev/null || true

# Get the latest tag
# TODO - parameterize the specific repo/image
LATEST_TAG=$(az acr repository show-tags --name "crremediations" --repository "nginx" --orderby time_desc --top 1 -o "tsv")

# TODO -  
kubectl set image deployment/nginx-deployment "nginx=crremediations.azurecr.io/nginx:$LATEST_TAG"
