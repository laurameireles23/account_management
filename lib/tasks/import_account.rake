namespace :import_account do
  require 'csv'

  desc "Imports a CSV file into an ActiveRecord table"
  errors = false
  file = 'db\contas.csv'
  task :import_csv => :environment do
    File.open(file).each do |row|
      begin
        row = row.split(",")

        account = row[0].strip.to_i
        balance = row[1].strip.to_i

        Account.create!(account: account, balance: balance)
      rescue => exception
        puts exception
        errors = true
      end
    end
  end

  if errors == false
    puts "Importação feita com sucesso :)"
  else
    puts "A importação falhou, tente novamente!"
  end
end
