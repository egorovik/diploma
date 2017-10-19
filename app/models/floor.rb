class Floor < ActiveRecord::Base
  belongs_to :hostel
  has_many :rooms
  
  validates :hostel, presence: true
  validates :floor_number, presence: true, uniqueness: {scope: :hostel}
  validates :rooms_count, presence: true, numericality: {only_integer: true, greater_then_or_equal_to: 0}
end
