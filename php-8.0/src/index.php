<?php

use Appwrite\Client;

// You can remove imports of services you don't use
use Appwrite\Services\Account;
use Appwrite\Services\Avatars;
use Appwrite\Services\Database;
use Appwrite\Services\Functions;
use Appwrite\Services\Health;
use Appwrite\Services\Locale;
use Appwrite\Services\Storage;
use Appwrite\Services\Teams;
use Appwrite\Services\Users;

require_once 'vendor/autoload.php';

$client = new Client();

// You can remove services you don't use
$account = new Account($client);
$avatars = new Avatars($client);
$database = new Database($client);
$functions = new Functions($client);
$helath = new Health($client);
$locale = new Locale($client);
$storage = new Storage($client);
$teams = new Teams($client);
$users = new Users($client);

$client
    ->setEndpoint(\getenv('APPWRITE_FUNCTION_ENDPOINT'))
    ->setProject(\getenv('APPWRITE_FUNCTION_PROJECT_ID'))
    ->setKey(\getenv('APPWRITE_FUNCTION_API_KEY'));

if(!\getenv('APPWRITE_FUNCTION_ENDPOINT') || !\getenv('APPWRITE_FUNCTION_API_KEY')) {
    echo('Some environment variables are not set. Function cannot use AppwriteSDK properly.');
}

/*
    '$req' variable has:
        'headers' - object with request headers
        'payload' - object with request body data
        'env' - object with environment variables

    '$res' variable has:
        'send(text, status)' - function to return text response. Status code defaults to 200
        'json(obj, status)' - function to return JSON response. Status code defaults to 200
    
    If an error is thrown, a response with code 500 will be returned.
*/

return function ($req, $res) {
    $res->json([
        'areDevelopersAwesome' => true
    ]);
};