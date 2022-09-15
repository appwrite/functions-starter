require 'appwrite'

=begin
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200

  If an error is thrown, a response with code 500 will be returned.
=end

def main(req, res)
  client = Appwrite::Client.new

  # You can remove services you don't use
  account = Appwrite::Account.new(client)
  avatars = Appwrite::Avatars.new(client)
  database = Appwrite::Databases.new(client)
  functions = Appwrite::Functions.new(client)
  health = Appwrite::Health.new(client)
  locale = Appwrite::Locale.new(client)
  storage = Appwrite::Storage.new(client)
  teams = Appwrite::Teams.new(client)
  users = Appwrite::Users.new(client)

  if !req.variables['APPWRITE_FUNCTION_ENDPOINT'] or !req.variables['APPWRITE_FUNCTION_API_KEY']
    puts "Environment variables are not set. Function cannot use Appwrite SDK."
  else
    client
      .set_endpoint(req.variables['APPWRITE_FUNCTION_ENDPOINT'])
      .set_project(req.variables['APPWRITE_FUNCTION_PROJECTID'])
      .set_key(req.variables['APPWRITE_FUNCTION_API_KEY'])
      .set_self_signed(true)
  end

  return res.json({
    :areDevelopersAwesome => true,
  })
end