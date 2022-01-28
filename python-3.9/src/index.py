import os
from appwrite.client import Client
from appwrite import services

if not os.environ['APPWRITE_FUNCTION_ENDPOINT'] or not os.environ['APPWRITE_FUNCTION_PROJECT_ID'] or not os.environ['APPWRITE_FUNCTION_API_KEY']:
  print('Please set APPWRITE_FUNCTION_ENDPOINT, APPWRITE_FUNCTION_PROJECT_ID and APPWRITE_FUNCTION_API_KEY environment variables.')

client = Client()

(
  client
  .setEndpoint(os.environ['APPWRITE_FUNCTION_ENDPOINT]'])
  .setProject(os.environ['APPWRITE_FUNCTION_PROJECT_ID'])
  .setKey(os.environ['APPWRITE_FUNCTION_API_KEY'])
)

account = services.Account(client)
avatars = services.Avatars(client)
database = services.Database(client)
functions = services.Functions(client)
health = services.Health(client)
locale = services.Locale(client)
storage = services.Storage(client)
teams = services.Teams(client)
users = services.Users(client)

def main(req, res):
  return res.json({
    "areDevelopersAwesome": True,
  })