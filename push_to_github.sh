#!/bin/bash

# Script pour ajouter un projet local à un dépôt GitHub
# Assurez-vous d'avoir installé git et d'être connecté à votre compte GitHub
# Ce script crée un .gitignore pour ignorer les screenshots et d'autres fichiers inutiles
# et pousse le projet vers un dépôt distant déjà créé sur GitHub.
# Assurez-vous d'avoir configuré votre clé SSH ou d'utiliser HTTPS pour le dépôt distant.
# Si vous utilisez HTTPS, assurez-vous d'avoir configuré votre token d'accès personnel.
# Si vous n'avez pas encore de dépôt distant, créez-en un sur GitHub avant d'exécuter ce script.


# === CONFIGURATION ===
REMOTE_URL="https://github.com/ton-utilisateur/ton-repo.git"  # <-- à modifier
BRANCHE="main"  

# === CREATION ou overriding de .gitignore ===
echo "Création d'un .gitignore pour ignorer les screenshots et autres fichiers..."
# Créer un .gitignore pour ignorer les screenshots de mes notebooks et d'autres fichiers inutiles
# Here document
# pour créer le fichier .gitignore
cat <<EOF > .gitignore
# Ignorer tous les screenshots
Screenshot-*.png

# Fichiers système courants à ignorer
.DS_Store
Thumbs.db

# Logs
*.log

# Dossiers Python (si jamais)
__pycache__/
*.pyc
EOF

# === GIT WORKFLOW ===
echo "Initialisation du dépôt Git..."
git init

echo "Ajout du remote origin..."
git remote add origin "$REMOTE_URL"

echo "Ajout des fichiers à l'index (en respectant .gitignore)..."
git add .

echo "Commit des fichiers..."
git commit -m "Ajout initial (avec .gitignore)"

echo "Pull si le repo distant contient déjà des fichiers..."
git pull origin "$BRANCHE" --allow-unrelated-histories

echo "Push vers GitHub..."
git push -u origin "$BRANCHE"

echo "✅ Terminé avec succès."