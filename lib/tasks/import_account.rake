namespace :import_account do
  require 'csv'

  desc "Imports a 'contas.csv' file into an ActiveRecord table"
  file = ('db\contas.csv')
  task :import_csv => :environment do
    File.open(file).each do |row|
      begin
        row = row.split(",")

        account = row[0].strip.to_i
        balance = row[1].strip.to_i

        Account.create!(account: account, balance: balance)

        puts "Importação de conta feita com sucesso :)"
      rescue => exception
        puts exception
        puts "A importação falhou, tente novamente!"
      end
    end
  end
end
