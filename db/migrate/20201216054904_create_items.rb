class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      unless ActiveRecord::Base.connection.table_exists?('items')
        t.string :name
        t.string :description
        t.float :unit_price

        t.references :merchant, foreign_key: true

        t.timestamps
      end
    end
  end
end
