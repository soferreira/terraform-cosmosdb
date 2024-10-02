# Azure provider version 
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource group 
resource "azurerm_resource_group" "cosmosdb_account" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "random_string" "db_account_name" {
  count = var.cosmosdb_account_name == null ? 1 : 0

  length  = 20
  upper   = false
  special = false
  numeric = false
}

locals {
  cosmosdb_account_name = try(random_string.db_account_name[0].result, var.cosmosdb_account_name)
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                      = local.cosmosdb_account_name
  location                  = var.cosmosdb_account_location
  resource_group_name       = azurerm_resource_group.cosmosdb_account.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  depends_on = [
    azurerm_resource_group.cosmosdb_account
  ]
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_database" {
  name                = var.cosmosdb_sqldb_name
  resource_group_name = azurerm_resource_group.cosmosdb_account.name
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
  autoscale_settings {
    max_throughput = var.max_throughput
  }
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_container_1" {
  name                  = "container1"
  resource_group_name   = azurerm_resource_group.cosmosdb_account.name
  account_name          = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.cosmosdb_database.name
  partition_key_paths    = ["/id"]
  partition_key_version = 1

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_container_2" {
  name                  = "container2"
  resource_group_name   = azurerm_resource_group.cosmosdb_account.name
  account_name          = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.cosmosdb_database.name
  partition_key_paths    = ["/id"]
  partition_key_version = 1

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}