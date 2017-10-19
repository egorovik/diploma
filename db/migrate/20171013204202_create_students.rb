class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :passport, index: true, foreign_key: true, null: false
      t.string :ln, null: false
      t.string :fn, null: false
      t.string :sn
      t.string :sex, null: false
      t.date :bday, null: false
      t.references :country, index: true, foreign_key: true, null: false
      t.references :nationality, index: true, foreign_key: true
      t.references :religion, index: true, foreign_key: true
      t.date :start_date
      t.date :finish_date
      t.references :group, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      
      t.index [:ln, :fn, :sn, :sex, :bday], unique: true
      
      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE students ADD CONSTRAINT empty_chk CHECK(sex IN ('м', 'ж'))")
      end
      dir.down do
        execute("ALTER TABLE students DROP CONSTRAINT empty_chk")
      end
    end
  end
end
