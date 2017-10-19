class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :short_name, null: false
      t.string :long_name, null: false
      t.string :alpha2, null: false
      t.string :alpha3, null: false
      t.string :country_code, null: false

      t.timestamps null: false
    end
  end
end
