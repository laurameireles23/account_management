class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account
      t.integer :value

      t.timestamps
    end
  end
end
