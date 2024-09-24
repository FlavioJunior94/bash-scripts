#!/bin/bash

hostname="$1"
hostnamectl set-hostname "$hostname"
#######DESATIVANDO FIREWALL##########
function Firewall(){
    echo "desativando firewall e selinux"
    systemctl stop firewalld
    sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config
    sudo sed -i 's/enforcing/disabled/g' /etc/sysconfig/selinux
    systemctl disable firewalld
}

#######UPDATE##########
function Update(){
    echo "atualizando"
    yum update -y
}

#######PACOTES##########
function Pacotes(){
    echo "instalando pacotes"
    yum install epel-release -y
    yum install htop zip unzip wget curl vim nano net-tools mtr telnet python-pip java-1.8.0-openjdk- policycoreutils-python python3 openssl openssl-devel -y
}

#######DOCKER##########
function Docker(){
    echo " instalando Docker e docker compose"
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
    sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    systemctl enable docker
    systemctl start docker
    systemctl status docker
    curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    docker-compose --version

}

main(){
    Firewall
    Update
    Pacotes
    Docker
    Update
}

main