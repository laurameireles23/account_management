class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account
      t.float :value
      t.integer :type

      t.timestamps
    end
  end
end
