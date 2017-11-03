class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.string :doc_type, null: false
      t.string :doc_number, null: false
      t.date :exp_date, null: false
      #translation
      #language
      
      t.index [:doc_number, :exp_date], unique: true

      t.timestamps null: false
    end
  end
end
