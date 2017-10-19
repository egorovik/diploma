json.extract! referral, :id, :student_id, :referral_number, :date, :speciality_id, :payment, :created_at, :updated_at
json.url referral_url(referral, format: :json)
