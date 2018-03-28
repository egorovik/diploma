class Document < ActiveRecord::Base
  belongs_to :student, inverse_of: :documents
  belongs_to :confirmation
  
  validates :student, presence: true
  validates :doc_type, presence: true, uniqueness: {scope: :doc_number}
  validates :doc_number, presence: true
  validates :exp_date, presence: true
  validates :language, presence: true
end
