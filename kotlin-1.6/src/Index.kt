import java.util.Map
import java.util.HashMap
import java.net.HttpURLConnection
import java.net.URL
import java.io.BufferedReader
import java.io.InputStreamReader
import com.google.gson.Gson
import io.appwrite.Client
import io.appwrite.services.Account
import io.appwrite.services.Avatars
import io.appwrite.services.Databases
import io.appwrite.services.Functions
import io.appwrite.services.Health
import io.appwrite.services.Locale
import io.appwrite.services.Storage
import io.appwrite.services.Teams
import io.appwrite.services.Users

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

private val gson = Gson()

@Throws(Exception::class)
fun main(req: RuntimeRequest, res: RuntimeResponse): RuntimeResponse {
    val client = Client()

    // You can remove services you don't use
    val account = Account(client)
    val avatars = Avatars(client)
    val database = Databases(client)
    val functions = Functions(client)
    val health = Health(client)
    val locale = Locale(client)
    val storage = Storage(client)
    val teams = Teams(client)
    val users = Users(client)

    if (req.variables["APPWRITE_FUNCTION_ENDPOINT"] == null || req.variables["APPWRITE_FUNCTION_API_KEY"] == null) {
        println("Environment variables are not set. Function cannot use Appwrite SDK.")
    } else {
        client
            .setEndpoint(req.variables["APPWRITE_FUNCTION_ENDPOINT"]!!)
            .setProject(req.variables["APPWRITE_FUNCTION_PROJECT_ID"]!!)
            .setKey(req.variables["APPWRITE_FUNCTION_API_KEY"]!!)
    }

    return res.json(mapOf(
        "areDevelopersAwesome" to true
    ))
}
