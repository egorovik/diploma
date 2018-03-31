class Student < ActiveRecord::Base
  belongs_to :passport
  belongs_to :country
  belongs_to :nationality
  belongs_to :religion
  belongs_to :group
  belongs_to :room
  belongs_to :referral
  has_many :documents, inverse_of: :student
  has_many :educations
  
  accepts_nested_attributes_for :documents, allow_destroy: true
  accepts_nested_attributes_for :passport
  
  validates :ln, presence: true
  validates :fn, presence: true
  validates :bday, presence: true, uniqueness: {scope: [:ln, :fn, :sn, :sex, :passport]}
  validates :sex, presence: true, inclusion: {in: [?м, ?ж]}
  validates :country, presence: true
  validate :check_room_free_space
  
  def check_room_free_space
    if !self.room.nil?
      if !(self.room.place_count > self.room.students.count)
        self.errors["room"] = "не имеет свободных мест для нового студента"
      end
    end
  end
  
  def same_room
    arr = []
    if self.room
      self.room.students.each do |s|
        arr << s.id if s.id != self.id
      end
    end
    return arr
  end
  
  def same_floor
    arr = []
    if self.room
      self.room.floor.rooms.each do |r|
        r.students.each do |s|
          arr << s.id if s.id != self.id
        end
      end
    end
    return arr
  end
  
  def same_hostel
    arr = []
    if self.room
      self.room.floor.hostel.floors.each do |f|
        f.rooms.each do |r|
          r.students.each do |s|
            arr << s.id if s.id != self.id
          end
        end
      end
    end
    return arr
  end
  
  def same_group
    arr = []
    if self.group
      self.group.students.each do |s|
        arr << s.id if s.id != self.id
      end
    end
    return arr
  end
  
  def higher_floor
    arr = []
    if self.room
      floor = self.room.floor.floor_number
      self.room.floor.hostel.floors.each do |f|
        if f.floor_number > floor
          f.rooms.each do |r|
            r.students.each do |s|
              arr << s.id if s.id != self.id
            end
          end
        end
      end
    end
    return arr
  end
    
  def lower_floor
    arr = []
    if self.room
      floor = self.room.floor.floor_number
      self.room.floor.hostel.floors.each do |f|
        if f.floor_number < floor
          f.rooms.each do |r|
            r.students.each do |s|
              arr << s.id if s.id != self.id
            end
          end
        end
      end
    end
    return arr
  end
  
  def check_restrictions
    arr = []
    Restriction.all.each do |r|
      res = r.check(self)
      arr << [r, res] if res.size > 0
    end
    return arr
  end
  
end
