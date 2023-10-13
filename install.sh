#!/bin/bash

# Frontend
npx create-vite@latest frontend --template react
cd frontend
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# Remplacer le contenu de tailwind.config.js
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

# Remplacer le contenu de index.css
cat > src/index.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities
EOL

# Remplacer le contenu de App.jsx
cat > src/App.jsx <<EOL
import React, { useState } from 'react'

function Counter() {
   const [count, setCount] = useState(0)

   const increment = () => {
      setCount(count + 1)
   }

   const decrement = () => {
      setCount(count - 1)
   }

   return (
      <div class="m-2">
         <div class="max-w-sm rounded overflow-hidden shadow-lg">
            <img class="w-full" src="https://placekitten.com/200/100" />
            <div class="px-6 py-4">
               <div class="font-bold text-xl mb-2">Compteur</div>
               <p class="text-gray-700 text-5xl">
                  {count}
               </p>
            </div>
            <div class="px-6 pt-4 pb-2">
               <button type="button" onClick={increment} class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                  Incrémenter
               </button>
               <button type="button" onClick={decrement} class="ml-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                  Décrémenter
               </button>
            </div>
         </div>
      </div>
   )
}

export default Counter
EOL

# Modifier le fichier vite.config.js
cat > vite.config.js <<EOL
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  server : {
    proxy: {
      '/api': 'http://localhost:3000'
    }
  },
  plugins: [react()]
});
EOL

# Backend
cd ..
mkdir backend
cd backend
npm init -y
npm install express
npm install prisma
npx prisma init
npm install nodemon --save-dev

# Ajouter "type": "module" dans le fichier package.json
jq '.type = "module"' package.json > tmp.json && mv tmp.json package.json

# Ajouter la commande "dev" dans les scripts de package.json du backend
jq '.scripts.dev = "npx nodemon backend.js"' backend/package.json > backend/package_tmp.json && mv backend/package_tmp.json backend/package.json

# Remplacer le contenu du fichier schema.prisma
cat > prisma/schema.prisma <<EOL
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
EOL

# Appliquer les migrations
npx prisma migrate dev --name init

# Ajouter la commande "dev" dans les scripts de package.json du backend
jq '.scripts.dev = "npx nodemon backend.js"' backend/package.json > backend/package_tmp.json && mv backend/package_tmp.json backend/package.json

echo "Installation terminée !"
