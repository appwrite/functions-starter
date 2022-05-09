import java.util.Map;
import java.util.HashMap;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import com.google.gson.Gson;
import io.appwrite.Client;
import io.appwrite.services.Account;
import io.appwrite.services.Avatars;
import io.appwrite.services.Database;
import io.appwrite.services.Functions;
import io.appwrite.services.Health;
import io.appwrite.services.Locale;
import io.appwrite.services.Storage;
import io.appwrite.services.Teams;
import io.appwrite.services.Users;

final Gson gson = new Gson();

public RuntimeResponse main(RuntimeRequest req, RuntimeResponse res) throws Exception {
    final Client client = new Client();

    // You can remove services you don't use
    Account account = new Account(client);
    Avatars avatars = new Avatars(client);
    Database database = new Database(client);
    Functions functions = new Functions(client);
    Health health = new Health(client);
    Locale locale = new Locale(client);
    Storage storage = new Storage(client);
    Teams teams = new Teams(client);
    Users users = new Users(client);

    Map<String, String> env = req.getEnv();

    if (env == null
    || !env.containsKey("APPWRITE_FUNCTION_ENDPOINT")
    || env.get("APPWRITE_FUNCTION_ENDPOINT") == null
    || !env.containsKey("APPWRITE_FUNCTION_API_KEY")
    || env.get("APPWRITE_FUNCTION_API_KEY") == null) {
        System.out.println("Environment variables are not set. Function cannot use Appwrite SDK.");
    } else {
    client
      .setEndpoint(env.get("APPWRITE_FUNCTION_ENDPOINT"))
      .setProject(env.get("APPWRITE_FUNCTION_PROJECT_ID"))
      .setKey(env.get("APPWRITE_FUNCTION_API_KEY"));
    }

    Map<String, Object> data = new HashMap<>();
    data.put("areDevelopersAwesome", true);

    return res.json(data);
}
