import os
from appwrite.client import Client
from appwrite import services

client = Client()

account = services.Account(client)
avatars = services.Avatars(client)
database = services.Database(client)
functions = services.Functions(client)
health = services.Health(client)
locale = services.Locale(client)
storage = services.Storage(client)
teams = services.Teams(client)
users = services.Users(client)

if not os.environ['APPWRITE_FUNCTION_ENDPOINT'] or not os.environ['APPWRITE_FUNCTION_API_KEY']:
  print('Environment variables are not set. Function cannot use Appwrite SDK.')
else:
  (
  client
    .setEndpoint(os.environ['APPWRITE_FUNCTION_ENDPOINT'])
    .setProject(os.environ['APPWRITE_FUNCTION_PROJECT_ID'])
    .setKey(os.environ['APPWRITE_FUNCTION_API_KEY'])
    .setSelfSigned(True)
  )

"""
  'req' variable has:
    'headers' - object with request headers
    'payload' - object with request body data
    'env' - object with environment variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200

  If an error is thrown, a response with code 500 will be returned.
"""

def main(req, res):
  return res.json({
    "areDevelopersAwesome": True,
  })