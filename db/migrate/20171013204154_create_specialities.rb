class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.integer :section_number, null: false
      t.string :section_name, null: false
      t.integer :group_number, null: false
      t.string :group_name, null: false
      t.string :subgroup_number, null: false
      t.string :subgroup_name, null: false
      t.string :speciality_code, null: false
      t.string :name, null: false
      t.string :edu_prog_code, null: false
      t.string :edu_area_code, null: false

      t.timestamps null: false
    end
  end
end
