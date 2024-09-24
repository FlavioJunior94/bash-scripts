#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
    echo "Este script deve ser executado como root."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Uso: $0 <novo_hostname>"
    exit 1
fi

NEW_HOSTNAME="$1"

echo "Atualizando todos os pacotes do sistema..."
yum update -y

if ! command -v dnf &> /dev/null; then
    echo "dnf não encontrado. Instalando..."
    yum install -y dnf
else
    echo "dnf já está instalado."
fi

if command -v dnf &> /dev/null; then
    echo "Atualizando pacotes com dnf..."
    dnf update -y
else
    echo "Atualização com dnf não é necessária."
fi

echo "Desligando e desabilitando o firewalld..."
systemctl stop firewalld
systemctl disable firewalld


echo "Desativando o SELinux..."

setenforce 0

sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

echo "Configurando o hostname para $NEW_HOSTNAME..."
hostnamectl set-hostname "$NEW_HOSTNAME"

echo "Reiniciando o sistema para aplicar todas as mudanças..."
reboot

