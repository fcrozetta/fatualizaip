#!/bin/bash -
# Autor: Fernando H. Crozetta
# Data : 14/09/2016
# Descricao: Script com finalidade de instalar os programas necessários dentro do server

# Runs as root only
if [[ $EUID -ne 0 ]]; then
	echo "Run as Root"
	exit 1
fi

#Buscar o tipo do instalador para jogar no comando
instalar='apt-get install'
if [[ $(which yum) ]]; then
	instalar='yum install'
fi

$instalar -y mysql-server

mysql -u'root' -p < scripts_sql/database_init.sql

read -p "Deseja alterar o mysql para receber conexões externas?(s/N)" option
if [[ $option == 's' ]]; then
	sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
	echo "caso seja necessário, realizar direcionamento de portas no firewall"
fi