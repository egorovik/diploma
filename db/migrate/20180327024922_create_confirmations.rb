class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.references :document, index: true, foreign_key: true
      t.string :express_rating
      t.string :expert_conclusion
      t.string :confirmation
      t.string :document_type
      t.string :serial
      t.string :number
      t.date :issue_date
      t.references :country, index: true, foreign_key: true
      t.string :education_organization
      t.string :issue_orgenization
      t.string :foreign_level
      t.string :rf_level
      t.string :reason
      t.string :person

      t.timestamps null: false
    end
  end
end
