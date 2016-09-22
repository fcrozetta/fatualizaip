#!/bin/bash
# Autor: Fernando H. Crozetta
# Data : [20/09/2016]
# Descrição: Script que adiciona um usuário no Banco de dados 
#				para utilizar apenas o comando update

usuario="$1"
senha="$2"
mysql -u root -p fatualizaip -e "create user '$1'@'%' identified by '$2';"
mysql -u root -p fatualizaip -e "grant update on fatualizaip.dados_servers to '$1'@'%' identified by '$2';"
mysql -u root -p fatualizaip -e "flush privileges;"