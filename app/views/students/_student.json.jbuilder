json.extract! student, :id, :passport_id, :ln, :fn, :sn, :sex, :country_id, :nationality_id, :religion_id, :start_date, :finish_date, :group_id, :room_id, :created_at, :updated_at
json.url student_url(student, format: :json)
