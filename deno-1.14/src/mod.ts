import { sdk } from "./deps.ts";

const client = new sdk.Client();

// You can remove services you don't use
let account = new sdk.Account(client);
let avatars = new sdk.Avatars(client);
let database = new sdk.Database(client);
let functions = new sdk.Functions(client);
let health = new sdk.Health(client);
let locale = new sdk.Locale(client);
let storage = new sdk.Storage(client);
let teams = new sdk.Teams(client);
let users = new sdk.Users(client);

if (!Deno.env.get('APPWRITE_FUNCTION_ENDPOINT') || !Deno.env.get('APPWRITE_FUNCTION_API_KEY')) {
  console.warn("Environment variables are not set. Function cannot use Appwrite SDK.");
} else {
  client
    .setEndpoint(Deno.env.get('APPWRITE_FUNCTION_ENDPOINT') as string)
    .setProject(Deno.env.get('APPWRITE_FUNCTION_PROJECT_ID') as string)
    .setKey(Deno.env.get('APPWRITE_FUNCTION_API_KEY') as string)
    .setSelfSigned(true);
}

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - object with request body data
    'env' - object with environment variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

export default async function (req: any, res: any) {
  res.json({
    areDevelopersAwesome: true,
  });
}