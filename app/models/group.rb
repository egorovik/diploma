class Group < ActiveRecord::Base
  belongs_to :speciality
  has_many :students
  
  validates :name, presence: true, uniqueness: true
  validates :speciality, presence: true
end
