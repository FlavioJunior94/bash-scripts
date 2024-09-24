# Repositório de Scripts Bash

Bem-vindo ao repositório de **Scripts Bash**! Este projeto contém uma coleção de scripts para diversas funções, visando facilitar e automatizar tarefas em sistemas baseados em Linux.

## Scripts Disponíveis

### 1. `repositorio-centos.sh`
Este script realiza a configuração do repositório do CentOS. Ele faz backup do repositório antigo, define um novo repositório e atualiza o sistema.

#### Funcionalidades:
- Backup do repositório antigo.
- Configuração de novos repositórios.
- Limpeza de cache e atualização do sistema.

### 2. `iac-oracle.sh`
Este script é utilizado para configurar um sistema Oracle Linux. Ele atualiza pacotes, configura o hostname, desativa o SELinux e reinicia o sistema.

#### Funcionalidades:
- Atualização de todos os pacotes do sistema.
- Verificação e instalação do `dnf`.
- Desativação do `firewalld` e do `SELinux`.
- Configuração do hostname.

### 3. `ftp.sh`
Este script instala e configura o servidor FTP `vsftpd`. Ele cria uma configuração básica e prepara um diretório para o usuário FTP.

#### Funcionalidades:
- Instalação do `vsftpd`.
- Configuração do arquivo de configuração do `vsftpd`.
- Criação de diretórios necessários para o servidor FTP.
- Configuração de um usuário FTP.


### 4. `glpi10.sh`
Este script instala e configura o GLPI, uma ferramenta de gestão de TI. Ele instala o Apache, MariaDB e PHP, configura o banco de dados e baixa o GLPI.

#### Funcionalidades:
- Atualiza o sistema e instala dependências.
- Configura o Apache para o GLPI.
- Cria banco de dados e usuário para o GLPI.
- Baixa e instala o GLPI.

### 5. `start_linux.sh`
Este script configura o hostname, desativa o firewall e SELinux, atualiza o sistema e instala pacotes essenciais, incluindo Docker e Docker Compose.

#### Funcionalidades:
- Configuração do hostname.
- Desativação do firewall e SELinux.
- Atualização do sistema e instalação de pacotes básicos.
- Instalação do Docker e Docker Compose.

### 6. `health.sh`
Este script verifica a saúde de um serviço web. Se o serviço não estiver ativo, ele inicia o serviço JBoss e registra a ação em um log.

#### Funcionalidades:
- Verifica o status de um serviço.
- Inicia o JBoss se necessário.
- Registra ações em um log.

### 7. `localstack.sh`
Este script instala o LocalStack, uma ferramenta para simular serviços da AWS em local.

#### Funcionalidades:
- Cria diretório para o LocalStack.
- Baixa e instala a CLI do LocalStack.

### 8. `mysql.sh`
Este script instala o MySQL Server a partir do repositório oficial MySQL, inicia o serviço e executa o script de segurança inicial.

#### Funcionalidades:
- Importa a chave GPG e configura o repositório MySQL.
- Instala o MySQL Server.
- Inicia o serviço MySQL.
- Exibe a senha temporária e executa o script `mysql_secure_installation` para configurar a segurança do MySQL.
