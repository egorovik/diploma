class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_number, null: false
      t.integer :place_count, null: false
      t.references :floor, index: true, foreign_key: true, null: false
      
      t.index [:room_number, :floor_id], unique: true

      t.timestamps null: false
    end
  end
end
