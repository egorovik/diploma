class Room < ActiveRecord::Base
  belongs_to :floor
  has_many :students
  
  validates :room_number, presence: true
  validates :place_count, presence: true, numericality: {only_integer: true, greater_then_or_equal_to: 0}
  validates :floor, presence: true, uniqueness: {scope: :room_number}
  validate :check_floor_free_space
  
  def check_floor_free_space
    if !self.floor.nil?
      if !(self.floor.rooms_count > self.floor.rooms.count)
        self.errors["floor"] = "не имеет свободных мест для новой комнаты"
      end
    end
  end
end
