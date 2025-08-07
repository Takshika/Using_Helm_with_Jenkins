#   Using_Helm_with_Jenkins
I have divided Jenkins stages into 3 stage one for downloading promitor repos, other for installing and final stage for checking the pods.

# 🚀 Using Helm with Jenkins for Promitor Deployment

This project demonstrates how to automate the deployment of [Promitor](https://github.com/tomkerkhove/promitor) using Jenkins and Helm. Promitor is an open-source tool that scrapes Azure Monitor metrics and exposes them to Prometheus.

This repository sets up a Promitor pod using a Helm chart and a custom `metric-declaration.yaml` file, allowing you to define and scrape project-specific Azure metrics efficiently.

---

## 🧠 What This Does

- Creates a **Promitor pod** using Helm
- Automates deployment with a **Jenkins pipeline**
- Scrapes Azure Monitor metrics using a **custom metric declaration**
- Exposes these metrics for consumption by **Prometheus**

---

## 🎯 Why Use This

- Automates infrastructure monitoring setup using CI/CD
- Monitors **Azure resources** using Promitor and exposes metrics
- Allows project-specific custom metric scraping
- Can be extended to broader **DevOps observability pipelines**

---

## 🧭 Project Flow

Here's a high-level view of how the pipeline works:

┌────────────────────────┐
│ Jenkins Pipeline │
└─────────┬──────────────┘
│
▼
┌────────────────────────────┐
│ Stage 1: Clone Helm Repo │
│ - Downloads Promitor Helm│
└─────────┬──────────────────┘
│
▼
┌────────────────────────────┐
│ Stage 2: Helm Install │
│ - Deploy Promitor Pod │
│ - Apply custom metric │
└─────────┬──────────────────┘
│
▼
┌────────────────────────────┐
│ Stage 3: Validation │
│ - Check pod status │
│ - Ensure metrics exposed │
└────────────────────────────┘


---

## ⚙️ How to Use

### 🔧 Prerequisites

- A running Kubernetes cluster (e.g., AKS or Minikube)
- Jenkins with:
  - Pipeline Plugin
  - Kubernetes CLI Plugin
- Helm installed
- Azure credentials configured

### 📥 Clone the Repo

```bash
git clone https://github.com/Takshika/Using_Helm_with_Jenkins.git
cd Using_Helm_with_Jenkins

🛠 Configure Jenkins
Place the Jenkinsfile in your Jenkins job or multibranch pipeline.

Make sure Kubernetes CLI (kubectl) and Helm are available in the Jenkins agent/container.

Set any needed credentials for Azure access using environment variables or credentials bindings.

🧾 Edit Metric Declaration
Open the metric-declaration.yaml file.

Customize it to define the Azure metrics you want to monitor.

This file defines what Promitor scrapes and how the data is exposed.

.

📁 Folder Structure

Using_Helm_with_Jenkins/
├── Jenkinsfile                   # CI/CD pipeline stages
├── metric-declaration.yaml      # Azure-specific metric definitions
├── helm-deploy.sh               # Shell script for Helm actions

❗ Known Issues Faced
While building this integration, I faced the following issues and documented them so others can avoid the same roadblocks:

🔎 Discussion #1751 – Metric Name Confusion
Initially unclear how metric name mapping worked in Promitor.

Resolution: Ensure correct Azure resource type and metric name pairing. Validate against Promitor docs.

🏷️ Discussion #1759 – Missing azurerm_resource_id
The azurerm_resource_id label was not appearing in the metrics output.

Resolution: Confirm correct scraping logic and Helm values file setup to ensure the label is included.


🔍 Example Use Case
Want to monitor an Azure Storage Account's capacity?

Add a resourceDiscoveryGroup in metric-declaration.yaml

Define the metrics to scrape

Run the Jenkins pipeline

Within minutes, Promitor will expose those metrics to Prometheus

📚 Resources
📘 Promitor GitHub Repository

📘 Promitor Documentation

📘 Azure Monitor Metrics

📘 Helm Charts Documentation

📘 Jenkins Pipeline Guide

Guide

🙌 Contributing
If you found this useful or have suggestions, feel free to fork, contribute, or raise issues! Pull requests are welcome.

🙏 Acknowledgements
Special thanks to Tom Kerkhove, the creator and maintainer of Promitor, for building and maintaining such an insightful open-source project.