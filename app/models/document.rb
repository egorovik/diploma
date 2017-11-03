class Document < ActiveRecord::Base
  belongs_to :student
  
  validates :student, presence: true
  validates :doc_type, presence: true
  validates :doc_number, presence: true
  validates :exp_date, presence: true, uniqueness: {scope: :doc_number}
  validates :language, presence: true
end
