#!/bin/bash

mkdir -p /docker/dockervolumes
mkdir /docker/composefiles
mkdir /docker/pobreflix
mkdir /Downloads

echo "Bienvenido al instalador de pobreflix, un combo loco de alegror automatizado... Banque un toque."
sleep 3
echo ""
echo "Voy a instalar los requerimientos."
echo ""
apt update && apt install docker.io docker-compose -y
echo "Activando el daemon automáticamente en el arranque"
echo ""
systemctl enable docker --now
echo "Agregando tu usuario al grupo docker para que pueda correr contenedores"
echo ""
usermod -a -G docker $USER
cp ./docker-compose.yaml.template /docker/composefiles/docker-compose.yaml.template
echo "Te creaste ya una cuenta en plex.tv? Si no lo hiciste te espero. Dale enter si ya está hecho"
read
echo "Ahora necesito que entres en https://www.plex.tv/claim, copies el código al toque y lo pegues acá, Recordá que expira a los 4 minutos de generado, no te duermas...:"
read plex_claim
echo "Modificando config"
echo ""
sed -i 's/CAMBIAME-CARAJO/$plex_claim/g' ./docker-compose.yaml.template > /docker/composefiles/docker-compose.yaml
echo "Inicializando los contenedores, a cruzar lo' dedo'..."
cd /docker/composefiles && docker-compose up -d && echo "Lista de contenedores activos" && docker ps
~                                                                               
