# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :account
      t.integer :balance

      t.timestamps
    end
  end
end
