#!/bin/bash -
# Autor: Fernando H. Crozetta
# Data : 16/09/2016
# Descricao: O script realiza a instalacao do maximo possivel automaticamente.
#				É necessário adicionar o script dentro do crontab para que os dados
#				sejam entregues de forma periódica corretamente
#	OBS: Nesta primeira versao a linha de comando do crontab deve ser executada no tempo definido

if [[ $EUID -ne 0 ]]; then
	echo "you need to be root"
	exit 1
fi

#Buscar o tipo do instalador para jogar no comando
instalar='apt-get install'
if [[ $(which yum) ]]; then
	instalar='yum install'
fi

# Inicialmente, apenas o mysql se faz necessario
$instalar -y mysql-client

diretorio_default='/usr/local/share/fatualizaip'
mkdir -p $diretorio_default
config=$diretorio_default/config


echo "#Gerado automaticamente. nao alterar" > $config
echo "diretorio=$( cd $(dirname $0) ; pwd -P)" >> $config
echo "mysql_config=$diretorio/mysql_config" >> $config

chmod 600 $config
chmod 600 $mysql_config

# Dados que serao passados ao server remoto:
read -p "Alias do servidor: " nome
echo "nome=$nome" >> $config
read -p "Tempo entre atualizacoes(minutos):" tempo
echo "tempo=$tempo" >> $config

# Dados para acesso ao BD
read -p "Mysql Usuario      :" mysql_usuario
read -p "Mysql IP           :" mysql_ip
read -p "Mysql Porta(3306)  :" mysql_porta
echo "Senha para conexao no banco de dados remoto:"
mysql_config_editor set --login-path=fatualizaip --host=$mysql_ip --user=$mysql_usuario --port=$mysql_porta --password