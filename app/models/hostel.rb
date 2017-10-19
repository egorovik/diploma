class Hostel < ActiveRecord::Base
  has_many :floors
  
  validates :name, presence: true
  validates :address, presence: true, uniqueness: {scope: :name}
  validates :floors_count, presence: true, numericality: {only_integer: true, greater_then_or_equal_to: 0}
end
