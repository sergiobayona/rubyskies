class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.string :postal_code
      t.string :country
      t.json :data
      t.boolean :cached_weather, default: false

      t.timestamps
    end

    add_index :weathers, %i[country postal_code]
  end
end
