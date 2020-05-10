Comandos:
  rails db:create --> para criar os bancos
  rails db:migrate --> para executar as migrações

  As contas e saldos estão no arquivo contas.csv
  As contas e transações estão no arquivo transacoes.csv

  bundle exec rake "import:imports[contas.csv , transacoes.csv]" --> importa e executa as operações bancarias com base nos dados das tabelas Transactions e Accounts.

  Foram utilizadas as gems rspec-rails e capybara para criação de testes e Rubocop para padronização de codigo.