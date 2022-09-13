
use super::{Response, RequestValue};

// json! is a useful macro for converting json into the Serde Json type (https://docs.rs/rocket/0.5.0-rc.1/rocket/serde/json/enum.Value.html).
use rocket::serde::json::json;

/*
  'Value' is rocket::serde::json::Value. and the docs of it can be found here: https://docs.rs/rocket/0.5.0-rc.1/rocket/serde/json/enum.Value.html

  'req' is a struct `RequestValue` that can be imported from super which contains the following:
    'headers' - object with request headers - "Option<Map<String, Value>>"
    'payload' - request body data as a string - "String"
    'variables' - object with function variables - "Map<String, Value>"
  'res' is a enum `Response` that can be imported from super which has the two following functions:
    'send(value: String)' - function to return text response.
    'json(value: Value)' - function to return JSON response.
  
  If an error is thrown, a response with code 500 will be returned.
*/
pub fn main(req: RequestValue) -> Response {
  return Response::json(
    json!({
      "areDevelopersAwesome": true
    })
  );
}