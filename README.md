# Deploy front react app + backend node app + prisma db

## deploy front react app
```shell
npx create-react-app prisma-react-app
cd .\prisma-react-app\
npm install prisma
npx prisma init
npm install --save express
npm install cors
```
*remplacer le fichier schema.prisma dans le dossier prisma-react-app/prisma*
*code de schema.prisma*
```
generator client {
   provider = "prisma-client-js"
}

datasource db {
   provider = "sqlite"
   url      = "file:./dev.db"
}

model Message {
  id    Int    @id @default(autoincrement())
  text  String
}
```

```shell
npx prisma migrate dev --name init
```

Installer https://sqlitebrowser.org/dl/ pour visualiser la db et insérer des données de test 

## deploy backend node app 
*code de backend.js à ajouter à votre projet*
```javascript
const express = require('express');
const app = express();
const port = 5000;
const { PrismaClient } = require('@prisma/client');
const cors = require('cors'); // Importez le module cors

app.use(cors()); // Utilisez cors


const prisma = new PrismaClient()

app.get('/', (req, res) => {
   res.send('Hello World, from express');
});

app.get('/message', (req, res) => {
   //retrive all data from message table
   prisma.message.findMany().then((result) => {
      //send only the "text" field
      res.send(result.map((message) => message.text));
   });
});

app.listen(port, function () {
   console.log("Server listening on port 5000")
 })
```
Pour lancer le back-end :
```shell
node back-end.js
```

## Front-end
*code de Message.js à ajouter à votre projet dans le src/*
```javascript
import React, { useEffect, useState } from 'react';

const API_URL = 'http://localhost:5000';

function Message() {
    const [message, setMessage] = useState('');
    useEffect(() => {
        fetch(`${API_URL}/message`)
            .then((res) => res.json())
            .then((data) => {
                setMessage(data[0] + ' ' + data[1] + ' ' + data[2]);
            });
    }, []);


  return (
    <div>
      <h1>Hello World Message</h1>
      <p>{message}</p>
    </div>
  );
}

export default Message;
```

*code de App.js à ajouter à votre projet dans le src/*
```javascript
import logo from './logo.svg';
import './App.css';
import Message from './Message';

function App() {
  return (
    <div className="App">
      <Message />
    </div>
  );
}

export default App;
```
