class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.string :serial, null: false
      t.string :number, null: false
      #passport_type
      #translation
      #language
      
      t.index [:serial, :number], unique: true
      t.timestamps null: false
    end
  end
end
