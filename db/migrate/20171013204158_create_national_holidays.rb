class CreateNationalHolidays < ActiveRecord::Migration
  def change
    create_table :national_holidays do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.references :nationality, index: true, foreign_key: true, null: false
      
      t.index [:name, :date], unique: true

      t.timestamps null: false
    end
  end
end
