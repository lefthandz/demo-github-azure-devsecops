import { AzureFunction, Context, HttpRequest } from '@azure/functions'
import { CosmosClient } from '@azure/cosmos'

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
  context.log('HTTP trigger function processed a request.');

  // Azure Cosmos DB へ接続する
  const endpoint = process.env.COSMOS_DB_ENDPOINT;
  const key = process.env.COSMOS_DB_KEY;
  const client = new CosmosClient({ endpoint, key });
  const database = await client.database('dirty');
  const container = await database.container('trick');

  // ユーザーからのリクエストのクエリを Azure Cosmos DB で実行する
  const query = req.query.query;
  await container.items.query(query);

  context.res = {
    // status: 200, /* Defaults to 200 */
    headers: {
      'Content-Type': 'application/json'
    },
    body: {}
  };
};

export default httpTrigger;
