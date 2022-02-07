import os
from appwrite.client import Client

# You can remove imports of services you don't use
from appwrite.services.account import Account
from appwrite.services.avatars import Avatars
from appwrite.services.database import Database
from appwrite.services.functions import Functions
from appwrite.services.health import Health
from appwrite.services.locale import Locale
from appwrite.services.storage import Storage
from appwrite.services.teams import Teams
from appwrite.services.users import Users

client = Client()

# You can remove services you don't use
account = Account(client)
avatars = Avatars(client)
database = Database(client)
functions = Functions(client)
health = Health(client)
locale = Locale(client)
storage = Storage(client)
teams = Teams(client)
users = Users(client)

if not os.getenv('APPWRITE_FUNCTION_ENDPOINT') or not os.getenv('APPWRITE_FUNCTION_API_KEY'):
  print('Environment variables are not set. Function cannot use Appwrite SDK.')
else:
  (
  client
    .set_endpoint(os.getenv('APPWRITE_FUNCTION_ENDPOINT'))
    .set_project(os.getenv('APPWRITE_FUNCTION_PROJECT_ID'))
    .set_key(os.getenv('APPWRITE_FUNCTION_API_KEY'))
    .set_self_signed(True)
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