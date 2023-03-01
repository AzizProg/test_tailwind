# Utiliser une image Node.js comme base
FROM node:latest AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application
COPY . .

# Installer les dépendances et compiler l'application
RUN npm install
RUN npm install -D tailwindcss
RUN npx tailwindcss init
RUN npx tailwindcss -i ./src/css/main.css -o ./dist/output.css --watch

# Utiliser une image Nginx pour servir l'application
FROM nginx:latest

# Copier les fichiers de l'application compilée dans le répertoire public de Nginx
COPY --from=build /app/public /usr/share/nginx/html

# Exposer le port 80 pour permettre l'accès à l'application
EXPOSE 80

# Démarrer Nginx lors du lancement du conteneur
CMD ["nginx", "-g", "daemon off;"]
