create database fatualizaip;
use fatualizaip;
create table dados_servers(
	alias varchar(45) not null unique,
    ip varchar(15) not null default '0.0.0.0',
    tempoUpdate int not null default '0',
    ultimoUpdate timestamp default current_timestamp,
	primary key (alias));