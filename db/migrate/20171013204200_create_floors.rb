class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.references :hostel, index: true, foreign_key: true, null: false
      t.integer :floor_number, null: false
      t.integer :rooms_count, null: false
      
      t.index [:hostel_id, :floor_number], unique: true

      t.timestamps null: false
    end
  end
end
