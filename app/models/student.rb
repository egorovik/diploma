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
  
end
