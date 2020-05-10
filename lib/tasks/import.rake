namespace :import do
  task :imports, [:account_file, :transaction_file] do |t, args|
    Rake.application.invoke_task("import_account:import_csv[#{args[:account_file]}]")
    Rake.application.invoke_task("import_transaction:import_csv[#{args[:account_file]}]")
    Rake.application.invoke_task("management:managements")
  end
end
