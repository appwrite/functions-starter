public async Task<RuntimeResponse> Main(RuntimeRequest req, RuntimeResponse res)
{
    return res.Json(new Dictionary<string, object>()
    {
        { "areDevelopersAwesome", true }
    });
}