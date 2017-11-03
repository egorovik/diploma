class Education < ActiveRecord::Base
  belongs_to :student
  
  validates :student, presence: true
  validates :edu_level, presence: true
  validates :language, presence: true
end
