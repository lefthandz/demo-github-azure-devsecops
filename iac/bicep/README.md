```bash
WORKLOAD="{ワークロードを示す文字列}"
LOCATION="japaneast"

RESOURCE_GROUP_NAME="rg-${WORKLOAD}"

az login
az group create --name ${RESOURCE_GROUP_NAME} --location ${LOCATION}
az deployment group create \
  --resource-group ${RESOURCE_GROUP_NAME} \
  --template-file ./iac/bicep/main.bicep \
  --parameters \
    workload=${WORKLOAD} \
    location=${LOCATION}
```