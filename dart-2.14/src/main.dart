import 'dart:io' show Platform;
import 'package:dart_appwrite/dart_appwrite.dart';
import 'function_types.dart';

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

Future<void> start(FunctionRequest request, FunctionResponse response) async {

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

  response.json({
    'areDevelopersAwesome': true,
  });
}