class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.string :referral_number, null: false
      t.date :date, null: false
      t.references :speciality, index: true, foreign_key: true, null: false
      t.integer :payment, null: false
      
      t.index [:referral_number, :date, :speciality_id], unique: true

      t.timestamps null: false
    end
  end
end
