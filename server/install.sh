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

# Inicialmente, apenas o mysql se faz necessario
$instalar -y mysql-server

mysql -u'root' -p < scripts_sql/database_init.sql