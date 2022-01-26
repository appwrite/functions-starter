
use super::{Response, RequestValue};

// json! is a useful macro for converting json into the Serde Json type.
use rocket::serde::json::json;

pub fn main(req: RequestValue) -> Response {
    return Response::json(
        json!({
            "areDevelopersAwesome": true
        })
    );
}