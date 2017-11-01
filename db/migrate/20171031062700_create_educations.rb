class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.string :edu_level, null: false
      t.string :language, null: false
      t.text :translation, null: false

      t.timestamps null: false
    end
  end
end
