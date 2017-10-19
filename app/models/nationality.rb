class Nationality < ActiveRecord::Base
  has_many :nation_holidays
  has_many :students
  
  validates :name, presence: true, uniqueness: true
end
