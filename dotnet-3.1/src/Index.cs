/*
  'req' variable has:
    'Headers' - object with request headers
    'Payload' - object with request body data
    'Env' - object with environment variables

  'res' variable has:
    'Send(text, status)' - function to return text response. Status code defaults to 200
    'Json(obj, status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

public async Task<RuntimeResponse> Main(RuntimeRequest req, RuntimeResponse res)
{
    // Appwrite SDK is not yet available for .NET

    return res.Json(new Dictionary<string, object>()
    {
        { "areDevelopersAwesome", true }
    });
}