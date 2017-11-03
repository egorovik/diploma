class AddLanguageToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :language, :string, null: false
  end
end
