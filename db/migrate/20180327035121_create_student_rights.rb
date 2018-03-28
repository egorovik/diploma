class CreateStudentRights < ActiveRecord::Migration
  def change
    create_table :student_rights do |t|
      t.references :nationality, index: true, foreign_key: true
      t.references :religion, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.integer :age
      t.references :speciality, index: true, foreign_key: true
      t.string :edu_level
      t.float :payment
      t.string :sex

      t.timestamps null: false
    end
  end
end
