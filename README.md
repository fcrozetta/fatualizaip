Este projeto se destina a criar uma forma de atualização dos endereços ip de servidores de clientes em uma base de dados do server.
Cada client possuirá um script que busca o endereço ip externo que possui e o envia para uma base de dados no server em um tempo determinado.
No banco de dados são contidos os seguintes dados:
alias       : Nome dado ao client para facilitar a busca (unico, e usado como chave primária)
ip          : Endereço externo do client que deve ser atualizado periódicamente
tempoUpdate : tempo em minutos entre um update e outro
ultimoUpdate: timestamp do ultimo update, atualizado junto com o ip

por comodidade o processo não será colocado como um daemon(ao menos por enquanto).
O script deve rodar no rc.local do servidor, ou equivalente.