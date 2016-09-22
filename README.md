Este projeto se destina a criar uma forma de atualização dos endereços de ip em uma base de dados do server. Cada client possuirá um script que busca o endereço ip externo que possui e o envia para uma base de dados no server em um tempo determinado.

Para facilitar a manutenção que o suporte técnico dá, a princípio não será usado um daemon para agendar estas atualizações, mas deve ser adicionada uma entrada no crontab do root.

