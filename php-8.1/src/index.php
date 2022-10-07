<?php

use Appwrite\Client;

// You can remove imports of services you don't use
use Appwrite\Services\Account;
use Appwrite\Services\Avatars;
use Appwrite\Services\Databases;
use Appwrite\Services\Functions;
use Appwrite\Services\Health;
use Appwrite\Services\Locale;
use Appwrite\Services\Storage;
use Appwrite\Services\Teams;
use Appwrite\Services\Users;

require_once 'vendor/autoload.php';

/*
  '$req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  '$res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200

  If an error is thrown, a response with code 500 will be returned.
*/

return function($req, $res) {
  $client = new Client();

  // You can remove services you don't use
  $account = new Account($client);
  $avatars = new Avatars($client);
  $database = new Databases($client);
  $functions = new Functions($client);
  $health = new Health($client);
  $locale = new Locale($client);
  $storage = new Storage($client);
  $teams = new Teams($client);
  $users = new Users($client);

  if(!$req['variables']['APPWRITE_FUNCTION_ENDPOINT'] || !$req['variables']['APPWRITE_FUNCTION_API_KEY']) {
    echo('Environment variables are not set. Function cannot use Appwrite SDK.');
  } else {
    $client
      ->setEndpoint($req['variables']['APPWRITE_FUNCTION_ENDPOINT'])
      ->setProject($req['variables']['APPWRITE_FUNCTION_PROJECT_ID'])
      ->setKey($req['variables']['APPWRITE_FUNCTION_API_KEY'])
      ->setSelfSigned(true);
  }

  $res->json([
    'areDevelopersAwesome' => true
  ]);
};