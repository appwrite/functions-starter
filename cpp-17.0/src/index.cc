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

#include <iostream>
#include <string>

static RuntimeResponse &main(const RuntimeRequest &req, RuntimeResponse &res) {

    // Appwrite's SDK for C++ is currently under the works and shall be available soon

    Json::Value response;
    response["areDevelopersAwesome"] = true;
    
    return res.json(response);
}
