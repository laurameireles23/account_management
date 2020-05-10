namespace :import_account do
  require 'csv'

  desc "Imports a 'contas.csv' file into an ActiveRecord table"
  task :import_csv, [:file] => :environment do |t, args|
    file = Rails.root.join("app", args[:file])
    File.open(file).each do |row|
      begin
        row = row.split(",")

        number = row[0].strip.to_i
        balance = row[1].strip.to_i

        Account.create!(number: number, balance: balance)
      rescue => exception
        puts exception
        puts "A importação falhou, tente novamente!"
      end
    end
    puts "Importação de conta feita com sucesso :)"
  end
end
