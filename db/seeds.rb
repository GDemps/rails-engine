require 'csv'

# - Add code to reset the primary key sequences on all 6 tables (merchants, items, customers, invoices, invoice_items, transactions)
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
# before running "rake db:seed", do the following:
# - put the "rails-engine-development.pgdump" file in db/data/
# - put the "items.csv" file in db/data/

cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails-engine_development db/data/rails-engine-development.pgdump"
puts "Loading PostgreSQL Data dump into local database with command:"
puts cmd
system(cmd)

# TODO

# - Import the CSV data into the Items table
items_csv = './db/data/items.csv'
CSV.foreach(items_csv, { headers: true, header_converters: :symbol }) do |item|
  unit_price = item[:unit_price].to_f / 100

  Item.create!(
    id: item[:id].to_i,
    name: item[:name],
    description: item[:description],
    unit_price: unit_price,
    merchant_id: item[:merchant_id].to_i,
    created_at: item[:created_at],
    updated_at: item[:updated_at]
  )
end
