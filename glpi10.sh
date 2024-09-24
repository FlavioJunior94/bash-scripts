#!/bin/bash

# Definir variáveis
GLPI_VERSION="10.0.16"
GLPI_TAR="glpi-${GLPI_VERSION}.tgz"
GLPI_URL="https://github.com/glpi-project/glpi/releases/download/${GLPI_VERSION}/${GLPI_TAR}"

# Atualizar o sistema
echo "Atualizando o sistema..."
sudo dnf update -y

# Instalar dependências básicas
echo "Instalando dependências básicas..."
sudo dnf install -y epel-release
sudo dnf install -y wget vim curl unzip tar

# Adicionar repositório Remi e instalar PHP 7.4
echo "Instalando PHP 7.4 e módulos..."
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
sudo dnf module reset php
sudo dnf module enable php:remi-7.4
sudo dnf install -y php php-mysqlnd php-pdo php-gd php-xml php-mbstring php-zip
sudo dnf install -y php-intl


# Instalar o Apache
echo "Instalando o Apache..."
sudo dnf install -y httpd

# Instalar o MariaDB (ou MySQL)
echo "Instalando o MariaDB..."
sudo dnf install -y mariadb-server mariadb

# Iniciar e habilitar serviços
echo "Iniciando e habilitando serviços..."
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Configurar MariaDB
echo "Configurando MariaDB..."
sudo mysql_secure_installation

# Criar banco de dados e usuário para o GLPI
echo "Criando banco de dados e usuário para o GLPI..."
MYSQL_ROOT_PASSWORD="Glpi1@Ad4aPter"  # Substitua pela senha root do MySQL
GLPI_DB_NAME="glpi_db"
GLPI_DB_USER="glpi_user"
GLPI_DB_PASS="Glpi1@Ad4aPter"

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${GLPI_DB_NAME};"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${GLPI_DB_USER}'@'localhost' IDENTIFIED BY '${GLPI_DB_PASS}';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${GLPI_DB_NAME}.* TO '${GLPI_DB_USER}'@'localhost';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Baixar e instalar o GLPI
echo "Baixando e instalando o GLPI..."
cd /var/www/html
sudo wget ${GLPI_URL}
sudo tar xzf ${GLPI_TAR}
sudo mv glpi /var/www/html/glpi
sudo chown -R apache:apache /var/www/html/glpi
sudo chmod -R 755 /var/www/html/glpi

# Configurar o Apache para o GLPI
echo "Configurando o Apache para o GLPI..."
cat <<EOL | sudo tee /etc/httpd/conf.d/glpi.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/glpi
    ServerName glpi.local

    <Directory /var/www/html/glpi>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog /var/log/httpd/glpi_error.log
    CustomLog /var/log/httpd/glpi_access.log combined
</VirtualHost>
EOL

# Reiniciar o Apache
echo "Reiniciando o Apache..."
sudo systemctl restart httpd

# Finalizar
echo "Instalação concluída. Acesse o GLPI através do navegador em http://<seu_ip_ou_nome_do_servidor>"
