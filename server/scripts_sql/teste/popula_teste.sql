use fatualizaip;
insert into dados_servers set alias='teste_vazio';
insert into dados_servers set 
	alias='teste_completo',
    ip='123.123.123.123',
    porta='99',
    tempoUpdate='1';

insert into dados_servers set
	alias="teste update",
    tempoUpdate='1',
    ultimoUpdate=current_timestamp;
    
insert into dados_servers set
	alias="testeupdate2",
    tempoUpdate='1',
    ultimoUpdate=current_timestamp;