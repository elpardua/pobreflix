#!/bin/bash

#Armo toda la estructura de directorios
sudo mkdir -p /docker/dockervolumes
sudo mkdir /docker/composefiles
sudo mkdir /docker/pobreflix
sudo mkdir /Downloads

echo "Bienvenido al instalador de pobreflix, un combo loco de alegror automatizado... Banque un toque."
sleep 3
echo ""

echo "Voy a instalar los requerimientos."
echo ""
sudo apt update && sudo apt install docker.io docker-compose -y

echo "Activando el daemon automáticamente en el arranque"
echo ""
sudo systemctl enable docker --now

sudo chown -R $USER:$USER /Downloads
sudo chown -R $USER:$USER /docker
find /Downloads -type d -exec chmod 775 {} +
find /docker -type d -exec chmod 775 {} +
cp docker-compose.yaml.template /docker/composefiles/docker-compose.yaml
cp docker-compose.yaml.template /docker/composefiles/docker-compose.yaml.template

cd /docker/composefiles/ && docker-compose up -d

echo "Te creaste ya una cuenta en plex.tv? Si no lo hiciste te espero. Dale enter si ya está hecho"
read

echo "Ahora necesito que entres en https://www.plex.tv/claim, copies el código al toque y lo pegues acá, Recordá que expira a los 4 minutos de generado, no te duermas...:"
read plex_claim

echo ""
echo "Modificando config"
echo ""

cd /docker/composefiles/ && sed 's/CAMBIAME-CARAJO/'"${plex_claim}"'/g' docker-compose.yaml.template > /docker/composefiles/docker-compose.yaml && docker-compose up -d
