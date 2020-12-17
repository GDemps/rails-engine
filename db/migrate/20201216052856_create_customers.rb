class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      unless ActiveRecord::Base.connection.table_exists?('customers')
        t.string :first_name
        t.string :last_name

        t.timestamps
      end
    end
  end
end
