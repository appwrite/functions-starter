const sdk = require('node-appwrite');

const client = new sdk.Client();

// You can remove services you don't use
let account = new sdk.Account(client);
let avatars = new sdk.Avatars(client);
let database = new sdk.Database(client);
let functions = new sdk.Functions(client);
let helath = new sdk.Health(client);
let locale = new sdk.Locale(client);
let storage = new sdk.Storage(client);
let teams = new sdk.Teams(client);
let users = new sdk.Users(client);

client
    .setEndpoint(process.env.APPWRITE_FUNCTION_ENDPOINT)
    .setProject(process.env.APPWRITE_FUNCTION_PROJECT_ID)
    .setKey(process.env.APPWRITE_FUNCTION_API_KEY);

if(!process.env.APPWRITE_FUNCTION_ENDPOINT || !process.env.APPWRITE_FUNCTION_API_KEY) {
    console.warn("Some environment variables are not set. Function cannot use AppwriteSDK properly.");
}

export default function(req, res) {
    res.json({
        areDevelopersAwesome: true,
    });
}