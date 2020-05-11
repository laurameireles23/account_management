# frozen_string_literal: true

namespace :import_account do
  require 'csv'

  desc "Imports a 'contas.csv' file into an ActiveRecord table"
  task :import_csv, [:file] => :environment do |_t, args|
    file = Rails.root.join('app', args[:file])
    CSV.foreach(file) do |row|
      begin
        number = row[0].strip.to_i
        balance = row[1].strip.to_i
        account = Account.find_by(number: number)

        if account.nil?
          Account.create!(number: number, balance: balance)
        end
      rescue StandardError => e
        puts e
        puts 'A importação falhou, tente novamente!'
      end
    end
    puts 'Importação de conta feita com sucesso :)'
  end
end
