#!/bin/bash

# Assign the first argument to the variable 'name'
PipelineDefinitionId=$1
SubscriptionId=$2
ResourceGroupName=$3
AksClusterName=$4

echo "pipeline: $PipelineDefinitionId, sub: $SubscriptionId, rg: $ResourceGroupName, cluster: $AksClusterName"