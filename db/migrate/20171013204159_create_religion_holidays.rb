class CreateReligionHolidays < ActiveRecord::Migration
  def change
    create_table :religion_holidays do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.references :religion, index: true, foreign_key: true, null: false
      
      t.index [:name, :date], unique: true

      t.timestamps null: false
    end
  end
end
