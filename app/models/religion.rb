class Religion < ActiveRecord::Base
  has_many :religion_holidays
  has_many :students
  
  validates :name, presence: true, uniqueness: true
end
