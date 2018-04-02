# Use a .env file

.env fileに環境変数を定義して、dotenv packageを使って読む

*.env*はcommitしないこと

> .env files allow you to put your environment variables inside a file. You just create a new file called .env in your project and slap your variables in there on different lines.

```sh
PORT=65534

DB_CONN="mongodb://react-cosmos-db:swQOhAsVjfHx3Q9VXh29T9U8xQNVGQ78lEQaL6yMNq3rOSA1WhUXHTOcmDf38Q8rg14NHtQLcUuMA==@react-cosmos-db.documents.azure.com:10255/?ssl=true&replicaSet=globaldb"
SECRET_KEY="b6264fca-8adf-457f-a94f-5a4b0d1ca2b9"
```

To read these values, there are a couple of options, but the easiest is to use the dotenv package from npm.

```sh
npm install dotenv --save
```


```js
// Use dotenv to read .env vars into Node
require('dotenv').config();
var MongoClient = require('mongodb').MongoClient;

// Reference .env vars off of the process.env object
MongoClient.connect(process.env.DB_CONN, function(err, db) {
  if(!err) {
    console.log("We are connected");
  }
});

```

# References
いい記事

<https://medium.freecodecamp.org/heres-how-you-can-actually-use-node-environment-variables-8fdf98f53a0a>