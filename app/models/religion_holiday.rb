class ReligionHoliday < ActiveRecord::Base
  belongs_to :religion
  validates :name, presence: true
  validates :date, presence: true, uniqueness: {scope: :name}
  validates :religion, presence: true
end
