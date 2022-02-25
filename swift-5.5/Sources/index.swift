import Appwrite
import AppwriteModels
import Foundation

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

func main(req: RequestValue, res: RequestResponse) -> RequestResponse {
  let client = Client()

  // You can remove services you don't use
  let account = Account(client)
  let avatars = Avatars(client)
  let database = Database(client)
  let functions = Functions(client)
  let health = Health(client)
  let locale = Locale(client)
  let storage = Storage(client)
  let teams = Teams(client)
  let users = Users(client)

  guard let endpoint = req.env["APPWRITE_FUNCTION_ENDPOINT"],
    let project = req.env["APPWRITE_FUNCTION_PROJECT_ID"],
    let apiKey = req.env["APPWRITE_FUNCTION_API_KEY"] else {
      print("Environment variables are not set. Function cannot use Appwrite SDK.")

  client
    .setEndpoint(endpoint)
    .setProject(projectId)
    .setKey(apiKey) 

  return res.json(data: [
    "areDevelopersAwesome": true
  ])
}
