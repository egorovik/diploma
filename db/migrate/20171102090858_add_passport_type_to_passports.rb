class AddPassportTypeToPassports < ActiveRecord::Migration
  def change
    add_column :passports, :passport_type, :string, null: false
  end
end
