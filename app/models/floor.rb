class Floor < ActiveRecord::Base
  belongs_to :hostel
  has_many :rooms
  
  validates :hostel, presence: true
  validates :floor_number, presence: true, uniqueness: {scope: :hostel}
  validates :rooms_count, presence: true, numericality: {only_integer: true, greater_then_or_equal_to: 0}
  validate :check_hostel_free_space
  
  def check_hostel_free_space
    if !self.hostel.nil?
      if !(self.hostel.floors_count > self.hostel.floors.count)
        self.errors["hostel"] = "не имеет свободных мест для нового этажа"
      end
    end
  end
end
