#!/bin/bash

# Actualizar sistema
echo "Actualizando sistema..."
apt-get update
apt-get upgrade -y

# Instalar Apache

apt-get update
apt-get install -y apache2

# Instalar Consul
echo "Instalando Consul server..."
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install consul -y



#-----------------------------------