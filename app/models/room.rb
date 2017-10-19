class Room < ActiveRecord::Base
  belongs_to :floor
  has_many :students
  
  validates :room_number, presence: true
  validates :place_count, presence: true, numericality: {only_integer: true, greater_then_or_equal_to: 0}
  validates :floor, presence: true, uniqueness: {scope: :room_number}
end
