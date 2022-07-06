import 'package:dart_appwrite/dart_appwrite.dart';

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
  Client client = Client();

  // Uncomment the sevices you need, delete the ones you don't
  // final account = Account(client);
  // final avatars = Avatars(client);
  // final database = Databases(client, databaseId: "YOUR_DATABASE_ID");
  // final functions = Functions(client);
  // final health = Health(client);
  // final locale = Locale(client);
  // final storage = Storage(client);
  // final teams = Teams(client);
  // final users = Users(client);

  if (req.env['APPWRITE_FUNCTION_ENDPOINT'] == null ||
      req.env['APPWRITE_FUNCTION_API_KEY'] == null) {
    print(
        "Environment variables are not set. Function cannot use Appwrite SDK.");
  } else {
    client
        .setEndpoint(req.env['APPWRITE_FUNCTION_ENDPOINT'])
        .setProject(req.env['APPWRITE_FUNCTION_PROJECT_ID'])
        .setKey(req.env['APPWRITE_FUNCTION_API_KEY'])
        .setSelfSigned(status: true);
  }

  res.json({
    'areDevelopersAwesome': true,
  });
}
