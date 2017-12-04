

# Install serverless globally

```
npm install serverless -g
```

# Login to your Serverless account

```
serverless login
```

# Create a serverless function

```
serverless create --template hello-world
```

# Deploy to cloud provider

```
serverless deploy
```

AWS provider credentialsがないとエラー

```
  Serverless Error ---------------------------------------

  ServerlessError: AWS provider credentials not found. Learn how to set up AWS provider credentials in our docs here: http://bit.ly/aws-creds-setup.

  Get Support --------------------------------------------
     Docs:          docs.serverless.com
     Bugs:          github.com/serverless/serverless/issues
     Forums:        forum.serverless.com
     Chat:          gitter.im/serverless/serverless
```

# Function deployed! Trigger with live url

````
http://xyz.amazonaws.com/hello-world
```