class CreateHostels < ActiveRecord::Migration
  def change
    create_table :hostels do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :floors_count, null: false
      
      t.index [:name, :address], unique: true

      t.timestamps null: false
    end
  end
end
