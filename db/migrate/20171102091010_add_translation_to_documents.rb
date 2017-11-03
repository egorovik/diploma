class AddTranslationToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :translation, :text
  end
end
