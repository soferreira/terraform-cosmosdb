# Cosmos DB NoSQL API E2E sample

This repository provides an end-to-end sample for working with the Cosmos DB NoSQL API, including infrastructure deployment using Terraform and data interaction using a Python client.

## Terraform

In the terraform folder, you will find a template that deploys a Cosmos DB account with one SQL database and two containers.

### Usage

To deploy the infrastructure, follow these steps:

```bash
terraform init
terraform plan 
terraform apply
```

## RBAC permissions

To manage data in your Azure Cosmos DB for NoSQL account, you need to grant the appropriate role-based access control (RBAC) permissions. This [article](https://learn.microsoft.com/azure/cosmos-db/nosql/security/how-to-grant-data-plane-role-based-access?tabs=custom-definition%2Ccsharp&pivots=azure-interface-cli#permission-model) walks through the steps to grant an identity access to manage data, ensuring secure and controlled access to your Cosmos DB resources.

## Python client

In the python-client folder, you will find a Python client that interacts with Cosmos DB. This client provides a simple interface for performing CRUD operations on your Cosmos DB containers.

### Usage

To run the Python client, follow these steps:

```bash
python document_management.py
```
