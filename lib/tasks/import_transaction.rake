namespace :import_transaction do
  require 'csv'

  desc "Imports a CSV file into an ActiveRecord table"
  errors = false
  file = 'db\transacoes.csv'
  task :import_csv => :environment do
    File.open(file).each do |row|
      begin
        row = row.split(",")

        account = row[0].strip.to_i
        value = row[1].strip.to_i

        Transaction.create!(account: account, value: value)
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
