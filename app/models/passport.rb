class Passport < ActiveRecord::Base
  belongs_to :student
  
  validates :serial, presence: true
  validates :number, presence: true, uniqueness: {scope: :serial}
  validates :language, presence: true
end
