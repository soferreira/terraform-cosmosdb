# Cosmos DB SQL API

This template deploys a cosmos db account with 1 sql databases and 2 containers.

## Variables

| Name | Description |
|-|-|
| resource_group_name | Name of existing resource group |
| location | Location where cosmos db will be deployed to | 
| cosmos_account_name | Name of cosmos db account | 
| cosmos_api | API for Cosmos db, should be "sql" in this example | 
| sql_dbs | Cosmos SQL DBs to create | 
| sql_db_containers | Cosmos SQL DB containers to create per each db | 

Please see terraform.tfvars.sample for example inputs. Above is the minimal input requirements for the cosmos db module. 

## Usage

```bash
terraform init
terraform plan 
terraform apply
```

## RBAC permissions

[Use data plane role-based access control with Azure Cosmos DB for NoSQL](https://learn.microsoft.com/en-gb/azure/cosmos-db/nosql/security/how-to-grant-data-plane-role-based-access?tabs=custom-definition%2Ccsharp&pivots=azure-interface-cli#permission-model)