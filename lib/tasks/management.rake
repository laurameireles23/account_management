# frozen_string_literal: true

namespace :management do
  desc 'Imports a CSV file into an ActiveRecord table'
  task managements: :environment do
    accounts = Account.all
    accounts.each do |account|
      number = account.number
      puts "ID da conta: #{number}"
      balance = account.balance

      transactions = Transaction.where(account: number)
      transactions.each do |transaction|
        value = transaction.value
        balance += value
        balance -= 300 if balance.negative? && value.negative?
        account.update!(balance: balance)
        puts "Saldo final da conta: #{balance}"
      end
    end
  end
end
