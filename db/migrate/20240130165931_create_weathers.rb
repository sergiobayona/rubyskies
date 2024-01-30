class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country
      t.text :data

      t.timestamps
    end
  end
end
