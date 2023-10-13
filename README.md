# Installation de l'application

Ce script d'installation automatisé vous permet de mettre en place un environnement de développement pour une application web utilisant React et Express. Il installe et configure les dépendances nécessaires, crée la structure de fichiers de base, et effectue les migrations de base de données avec Prisma. Suivez ces étapes pour installer l'application sur votre système.

## Prérequis

Avant d'exécuter ce script, assurez-vous que vous avez Node.js et NPM (Node Package Manager) installés sur votre système. Vous pouvez les installer en suivant les instructions sur le site officiel de Node.js : [https://nodejs.org/](https://nodejs.org/).

## Installation

1. Clonez ce dépôt (si ce n'est pas déjà fait) :

   ```bash
   git clone https://github.com/HayZun/HelloWorld.git
   ```

2. Naviguez dans le répertoire de votre projet :

   ```bash
   cd HelloWorld
   ```

3. Exécutez le script d'installation `install.sh` :

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

   Le script effectuera les étapes suivantes :

   - Frontend : Création d'une application React avec Vite, installation de Tailwind CSS, configuration de Tailwind, et remplacement de fichiers de configuration et de code source.
   - Backend : Initialisation d'un projet Express avec Prisma, modification du fichier `package.json` pour spécifier `"type": "module"`, remplacement du fichier `schema.prisma`, et application des migrations de base de données.

4. Une fois le script terminé, votre environnement de développement est prêt.

## Démarrage de l'application

Après avoir exécuté le script d'installation, vous pouvez démarrer l'application en exécutant les commandes suivantes :

### Démarrage du frontend

Pour démarrer le frontend, utilisez la commande suivante dans le répertoire racine de votre projet :

```bash
cd frontend
npm run dev
```

Votre application frontend sera accessible à l'adresse [http://localhost:3000](http://localhost:5172).

### Démarrage du backend

Pour démarrer le backend, utilisez la commande suivante dans le répertoire racine de votre projet :

```bash
cd backend
npm run dev
```

Votre serveur Express sera accessible à l'adresse [http://localhost:3001](http://localhost:3000).
