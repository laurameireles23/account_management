# frozen_string_literal: true

class RenameColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :account, :number
  end
end
