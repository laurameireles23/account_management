namespace :management do

  desc "Imports a CSV file into an ActiveRecord table"
  task :managements => :environment do
    accounts = Account.all
    accounts.each do |account|
      number = account.number
      puts "ID da conta: #{number.to_s}" 
      balance = account.balance

      transactions = Transaction.where(account: number)
      transactions.each do |transaction|
        value = transaction.value
        balance += value
        if balance < 0 && value < 0
          balance -= 300
        end
        account.update!(balance: balance)
        puts "Saldo final da conta: #{balance.to_s}" 
      end
    end
  end
end
