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
`npx prisma migrate dev --name init`

#installer https://sqlitebrowser.org/dl/ pour visualiser la db et insérer des données de test 

## deploy backend node app 
*copier le fichier backend.js dans votre projet*
Pour lancer le back-end :
`node back-end.js`

## Front-end
*ajouter le fichier Message.js dans votre projet*

*code de App.js*
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
