import 'dart:io' show Platform;
import 'package:dart_appwrite/dart_appwrite.dart';

Client client = Client();

// You can remove services you don't use
Account account = Account(client);
Avatars avatars = Avatars(client);
Database database = Database(client);
Functions functions = Functions(client);
Health health = Health(client);
Locale locale = Locale(client);
Storage storage = Storage(client);
Teams teams = Teams(client);
Users users = Users(client);

Map<String, String> envVars = Platform.environment;

if(
  envVars.containsKey('APPWRITE_FUNCTION_ENDPOINT') == false
  || envVars.containsKey('APPWRITE_FUNCTION_API_KEY') == false
) {
  print("Environment variables are not set. Function cannot use Appwrite SDK.");
} else {
  client
    .setEndpoint(envVars['APPWRITE_FUNCTION_ENDPOINT'])
    .setProject(envVars['APPWRITE_FUNCTION_PROJECT_ID'])
    .setKey(envVars['APPWRITE_FUNCTION_API_KEY'])
    .setSelfSigned(status: true);
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

Future<void> start(final req, final res) async {
  response.json({
    'areDevelopersAwesome': true,
  });
}