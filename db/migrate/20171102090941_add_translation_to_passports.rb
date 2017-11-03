class AddTranslationToPassports < ActiveRecord::Migration
  def change
    add_column :passports, :translation, :text
  end
end
