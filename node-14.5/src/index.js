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

module.exports = function(req, res) {
    res.json({
        areDevelopersAwesome: true,
    });
}