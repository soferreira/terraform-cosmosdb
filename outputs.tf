output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.cosmosdb_account.name
}
output "cosmosdb_database_name" {
  value = azurerm_cosmosdb_sql_database.cosmosdb_database.name
}
output "cosmosdb_container_name_1" {
  value = azurerm_cosmosdb_sql_container.cosmosdb_container_1.name 
}
output "cosmosdb_container_name_2" {
  value = azurerm_cosmosdb_sql_container.cosmosdb_container_2.name
}