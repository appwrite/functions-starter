require 'appwrite'

if !ENV.has_key?('APPWRITE_FUNCTION_ENDPOINT') or !ENV.has_key?('APPWRITE_FUNCTION_PROJECTID') or !ENV.has_key?('APPWRITE_FUNCTION_API_KEY')
  puts "Usage: ruby index.rb <project_key> <secret_key> <environment>"
  exit
end

client = Appwrite::Client.new
account = Appwrite::Account.new(client)
avatars = Appwrite::Avatars.new(client)
database = Appwrite::Database.new(client)
functions = Appwrite::Functions.new(client)
health = Appwrite::Health.new(client)
locale = Appwrite::Locale.new(client)
storage = Appwrite::Storage.new(client)
teams = Appwrite::Teams.new(client)
users = Appwrite::Users.new(client)

client
 .setEndpoint(ENV['APPWRITE_FUNCTION_ENDPOINT'])
 .setProject(ENV['APPWRITE_FUNCTION_PROJECTID'])
 .setKey(ENV['APPWRITE_FUNCTION_API_KEY'])


def main(request, response)
  return response.json({
    :areDevelopersAwesome => true,
  })
end