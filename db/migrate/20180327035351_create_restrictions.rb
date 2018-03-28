class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.references :student_left, index: true, foreign_key: true
      t.references :student_right, index: true, foreign_key: true
      t.string :restriction
      t.string :restriction_type

      t.timestamps null: false
    end
  end
end
