#! /bin/bash

#Setting up the subscription
az account set --subscription <subscription_Id>

#Login to ACR
az acr login --name <acr_name>

#Connect to AKS-cluster
az aks get-credentials --name <akscluster_name>--resource-group <resource_group>

#Check the running pods
kubectl get pods 

# Downloading helm chart for promitor from Artifactory
wget https://artifactory.server.com/artifactory/promitor-chart.tar.gz

#Untar zip file and remove tgz file
tar -xvf promitor-chart.tar.gz
rm promitor-chart.tar.gz
cp metric-declaration.yaml promitor-chart/metric-declaration.yaml
