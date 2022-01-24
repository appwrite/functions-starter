TODO: Better links to docs, autoDeploy in command, commands for both unix/powershell

# 📧 Unnamed function

<!-- Give your function a name -->

Welcome to the documentation of this function 👋 We strongly recommend keeping this file in sync with your function's logic to make sure anyone can easily understand your function in future. If you don't need a documentation, you can remove this file.

## 📝 Environment Variables

List of environment variables used by this cloud functions:

- **APPWRITE_FUNCTION_ENDPOINT** - Endpoint of Appwrite project
- **APPWRITE_FUNCTION_API_KEY** - Appwrite API Key
<!-- Add your custom environments variables -->

## 🤖 Documentation

_Description:_

Simple function similiar to typical "hello world" example, but instead, we let everyone know how awesome developers are.

<!-- Update with your description, for example 'Create Stripe payment and return payment URL' -->

_Example input:_

No input

<!-- If input is expected, add example -->

_Example output:_

<!-- Update with your expected output -->

```json
{
 "areDevelopersAwesome": true
}
```

## 🚀 Deployment

There are multiple ways of deploying Appwrite function, all having the same results, but each using different process. We highly recommend using CLI deployment alongside `appwrite.json` to achieve the best experience.

### CLI with appwrite.json

Make sure you have [Appwrite CLI](https://appwrite.io/docs/command-line) installed, and you have successfully logged into your Appwrite server. You should also have `appwrite.json` file in your project folder (not this specific function) that was generated when you first initialized project with `appwrite init`.

To deploy a function, make sure you are inside your project folder, and you run `appwrite deploy functions`. You will be prompted to select which functions you want to deploy.

### CLI without appwrite.json

Make sure you have [Appwrite CLI](https://appwrite.io/docs/command-line) installed, and you have successfully logged into your Appwrite server. Also make sure you have Appwrite function manually created in Appwrite Console (web interface).

To deploy a function, make sure you are inside this function folder. Then, you execute a script providing it with function ID:

```bash
appwrite functions createTag \
    --functionId=[YOUR_FUNCTION_ID_HERE] \
    --entrypoint='src/index.js' \
    --code='.'
```

> Script above uses Unix syntax and may differ on your platform. You can learn more in [functions documentation](https://appwrite.io/docs/functions).

### Manual using tar.gz

Manual deployment has no requirements, and will be using Appwrite Console to deploy the tag. After creating a function, click on `Deploy Tag` button and switch to `Manual` tab. There, set the `entrypoint` to `src/index.js`, and upload the `code.tar.gz` file.

TODO: explain how to create code.tar.gz
