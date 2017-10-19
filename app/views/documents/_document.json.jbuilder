json.extract! document, :id, :student_id, :doc_type, :doc_number, :exp_date, :created_at, :updated_at
json.url document_url(document, format: :json)
