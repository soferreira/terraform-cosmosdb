#!/bin/bash

# Variables
RESOURCE_GROUP="<name-of-existing-resource-group>"
ACCOUNT_NAME="<name-of-existing-nosql-account>"
ROLE_DEFINITION_BODY="@role-definition.json"
ROLE_DEFINITION_ID="<id-of-new-role-definition>"
PRINCIPAL_ID="<id-of-existing-identity>"
SUBSCRIPION_ID="<subscription-id>"
SCOPE="/subscriptions/${SUBSCRIPION_ID}/resourceGroups/${RESOURCE_GROUP}/providers/Microsoft.DocumentDB/databaseAccounts/${DATABASE_ACCOUNT}"

# Create role definition
az cosmosdb sql role definition create \
    --resource-group $RESOURCE_GROUP \
    --account-name $ACCOUNT_NAME \
    --body $ROLE_DEFINITION_BODY

# Create role assignment
az cosmosdb sql role assignment create \
    --resource-group $RESOURCE_GROUP \
    --account-name $ACCOUNT_NAME \
    --role-definition-id $ROLE_DEFINITION_ID \
    --principal-id $PRINCIPAL_ID \
    --scope $SCOPE