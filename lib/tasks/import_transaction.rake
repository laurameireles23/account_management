# frozen_string_literal: true

namespace :import_transaction do
  require 'csv'

  desc "Imports a 'transacoes.csv' file into an ActiveRecord table"
  task :import_csv, [:file] => :environment do |_t, args|
    file = Rails.root.join('app', args[:file])
    File.open(file).each do |row|
      begin
        row = row.split(',')

        account = row[0].strip.to_i
        value = row[1].strip.to_i

        Transaction.create!(account: account, value: value)
      rescue StandardError => e
        puts e
        puts 'A importação falhou, tente novamente!'
      end
    end
    puts 'Importação de transação feita com sucesso :)'
  end
end
