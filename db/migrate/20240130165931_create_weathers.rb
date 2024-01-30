class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.string :location
      t.string :zip
      t.text :data

      t.timestamps
    end
  end
end
