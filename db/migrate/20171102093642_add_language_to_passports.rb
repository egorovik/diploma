class AddLanguageToPassports < ActiveRecord::Migration
  def change
    add_column :passports, :language, :string, null: false
  end
end
