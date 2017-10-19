class NationalHoliday < ActiveRecord::Base
  belongs_to :nationality
  
  validates :name, presence: true
  validates :date, presence: true, uniqueness: {scope: :name}
  validates :nationality, presence: true
  
end
