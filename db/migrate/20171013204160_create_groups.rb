class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.references :speciality, index: true, foreign_key: true, null: false
      
      t.index :name, unique: true 

      t.timestamps null: false
    end
  end
end
