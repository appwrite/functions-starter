import 'dart:io' show Platform;
import 'package:dart_appwrite/dart_appwrite.dart';
import 'function_types.dart';

Client client = Client();
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
    envVars.containsKey('APPWRITE_API_KEY') == false
    || envVars.containsKey('APPWRITE_API_KEY') == false
    || envVars.containsKey('APPWRITE_API_KEY') == false
  ) {
    print("Please set APPWRITE_FUNCTION_ENDPOINT, APPWRITE_FUNCTION_PROJECT_ID and APPWRITE_FUNCTION_API_KEY environment variables.");
  }

  client
  .setEndpoint('https://YOUR_ENDPOINT/v1')
  .setProject('YOUR_PROJECT_ID')
  .setKey('YOUR_APPWRITE_KEY')
  .setSelfSigned(status: true);

  response.json({
    'areDevelopersAwesome': true,
  });
}