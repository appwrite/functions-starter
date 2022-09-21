import 'package:dart_appwrite/dart_appwrite.dart';

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status: status)' - function to return text response. Status code defaults to 200
    'json(obj, status: status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

Future<void> start(final req, final res) async {
  Client client = Client();

  // You can remove services you don't use
  Account account = Account(client);
  Avatars avatars = Avatars(client);
  Databases database = Databases(client);
  Functions functions = Functions(client);
  Health health = Health(client);
  Locale locale = Locale(client);
  Storage storage = Storage(client);
  Teams teams = Teams(client);
  Users users = Users(client);

  if(
    req.variables['APPWRITE_FUNCTION_ENDPOINT'] == null
      || req.variables['APPWRITE_FUNCTION_API_KEY'] == null
  ) {
    print("Environment variables are not set. Function cannot use Appwrite SDK.");
  } else {
    client
      .setEndpoint(req.variables['APPWRITE_FUNCTION_ENDPOINT'])
      .setProject(req.variables['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(req.variables['APPWRITE_FUNCTION_API_KEY'])
      .setSelfSigned(status: true);
  }

  res.json({
    'areDevelopersAwesome': true,
  });
}