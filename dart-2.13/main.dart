import 'dart:convert';
import 'package:function_types/function_types.dart';
import 'package:dart_appwrite/dart_appwrite.dart';

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


Future<void> start(Request request, Response response) async {
  client
  .setEndpoint('https://YOUR_ENDPOINT/v1')
  .setProject('YOUR_PROJECT_ID')
  .setKey('YOUR_APPWRITE_KEY')
  .setSelfSigned(status: true);

  print(
    json.encode({
      'areDevelopersAwesome': true,
    })
  );
}