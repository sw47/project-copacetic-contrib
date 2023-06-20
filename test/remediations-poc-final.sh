body="{\"definition\": {\"id\": $PipelineId}}"
# Invoke the REST API
pat=$(az keyvault secret show --id "https://remediationskv.vault.azure.net/secrets/DylanPat" --query "value" -o "tsv")
az rest --method post --uri "https://dev.azure.com/msazure/one/_apis/build/builds?api-version=6.1-preview.6" --body "$body" --headers "Content-Type=application/json" "Authorization=Basic $(echo -n ":$pat" | base64)"

# Wait 5 minutes
sleep 300

az account set --subscription $SubscriptionId

az aks get-credentials --resource-group $ResourceGroupName --name $AksClusterName

az aks update --resource-group $ResourceGroupName --name $AksClusterName --tags RemediationsPOCUpdate=true

az aks install-cli --only-show-errors

az aks update -n $AksClusterName -g $ResourceGroupName --attach-acr "crremediations"

# Get the latest tag
LATEST_TAG=$(az acr repository show-tags --name $ACR_NAME --repository $IMAGE_NAME --orderby time_desc --top 1 -o "tsv")

kubectl set image deployment/nginx-deployment nginx=crremediations.azurecr.io/nginx:$LATEST_TAG
