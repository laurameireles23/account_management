# Account Management

Esta aplicação é o resultado de um teste enviado pela empresa Iugu, onde deveria rodar apenas um comando para fazer a importação de dois arquivos csv, o mesmo fosse salvo, e depois calculos seriam feitos a partir dos dados obtidos.


### Pré requisitos

Para este projeto funcionar, os seguintes pré requisitos devem ser atendidos:

```
- Ter instalado o Ruby (versão utilizada: 2.3.3);
- Ter instalado o Rails (versão utilizada: 5.1.7);
- Ter instalado o MySql;
- Ter instalado o bundle;
```

### Instalando

Para instalar este projeto basta seguir os seguintes passos:

```
- Clonar este projeto;
```

Após clonar, basta rodar os comandos abaixo:

```
- bundle
- rails db:create
- rails db:migrate
- rails db:migrate RAILS_ENV= test (para rodar a base de testes)
```

Após estes comandos, seu projeto estará pronto para uso :)

### Possiveis erros com o banco de dados
Caso tenha erros ao tentar criar o banco, rodar os seguintes comandos(os mesmos funcionaram no windows):

```
- mysql -u root -p -h localhost
- ALTER USER ‘root’@’localhost’ IDENTIFIED WITH mysql_native_password BY '1234';
```

## Iniciando
Para facilitar o teste, foram criados dois arquivos na pasta app do projeto, o contas.csv e transacoes.csv. Os mesmos estão divididos da seguinte maneira:

```
- As contas e saldos estão no arquivo contas.csv
- As contas e transações estão no arquivo transacoes.csv
```

## Como testar
Para testar basta executar o seguinte comando:
```
bundle exec rake "import:imports[contas.csv, transacoes.csv]"
```

O mesmo importa e executa as operações bancarias com base nos dados das tabelas Transactions e Accounts.

## Construído com

Foram utilizadas as gems:
* Rails - Utilizado para acelerar o desenvolvimento, pois promove muitas facilidades no desenvolvimento;
* Rubocop - Usado para a padronização de codigo.
* MySql - Para utilizar o banco de dados MySql.


## Autores

* **Laura Meireles** - [Perfil github](https://github.com/laurameireles23)
