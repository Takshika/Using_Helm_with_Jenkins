#! /bin/bash

# Setting the Azure subscription context to the specified subscription ID
az account set --subscription <subscription_Id>

# Logging into Azure Container Registry (ACR) with the given registry name
az acr login --name <acr_name>

# Downloading AKS cluster credentials and configuring kubectl to use this cluster
# Note: Add space after <akscluster_name> and before --resource-group
az aks get-credentials --name <akscluster_name> --resource-group <resource_group>

# Listing all running pods in the current Kubernetes context to verify cluster status
kubectl get pods 

# Download the Promitor Helm chart archive from your Artifactory server
wget https://test-artifactory.server.com/artifactory/promitor-chart.tar.gz

# Extract the contents of the downloaded tar.gz archive
tar -xvf promitor-chart.tar.gz

# Remove the downloaded tar.gz file to clean up workspace
rm promitor-chart.tar.gz

# Copy your local metric declaration YAML file into the extracted Promitor chart directory
# This customizes the Promitor deployment with your Azure metric configuration
cp metric-declaration.yaml promitor-chart/metric-declaration.yaml
