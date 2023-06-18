result=$(az keyvault list); echo \"arg1 is: $1\"; echo \"arg2 is: $2\"; echo \"Username is: $UserName\"; echo \"password is: $Password\"; echo $result | jq -c '{Result: map({id: .id})}' > $AZ_SCRIPTS_OUTPUT_PATH

jq -arg var1 \"$PipelineId\" '{key1: $var1}' > $AZ_SCRIPTS_OUTPUT_PATH