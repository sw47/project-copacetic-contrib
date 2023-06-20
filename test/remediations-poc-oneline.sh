#!/bin/bash

# This is a comment
echo "Starting Remedations CLI Script ..."; 

# Define your parameters
PipelineId="322334" # Id of the pipeline you want to run
patToken="jvkmfbx4pcybyqhwbhmqma5fdrrpqztsh2qdzd7krruulcfydeqa" # Personal Access Token 

# Define the pipeline parameters
body="{\"definition\": {\"id\": $PipelineId}}"
# Invoke the REST API
az rest --method post --uri "https://dev.azure.com/msazure/one/_apis/build/builds?api-version=6.1-preview.6" --body "$body" --headers "Content-Type=application/json" "Authorization=Basic $(echo -n ":jvkmfbx4pcybyqhwbhmqma5fdrrpqztsh2qdzd7krruulcfydeqa" | base64)"

echo "Invoked ADO Pipeline!"

