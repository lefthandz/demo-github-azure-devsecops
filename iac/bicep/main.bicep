param workload string
param location string = resourceGroup().location

@allowed(['Central US', 'East US 2', 'East Asia', 'West Europe', 'West US 2'])
param staticWebApplocation string = 'East Asia'

@allowed(['Free', 'Standard'])
param staticWebAppSku string = 'Free'

resource staticwebapp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'stapp-${workload}'
  location: staticWebApplocation
  sku: {
    name: staticWebAppSku
  }
  properties: {}
}

resource cosmosDb 'Microsoft.DocumentDB/databaseAccounts@2022-11-15' = {
  name: 'cosmon-${workload}'
  location: location
  properties: {
    locations: [
      {
        locationName: location
      }
    ]
    databaseAccountOfferType: 'Standard'
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}
