class Referral < ActiveRecord::Base
  belongs_to :student
  belongs_to :speciality
  
  validates :student, presence: true
  validates :referral_number, presence: true, uniqueness: true
  validates :date, presence: true
  validates :speciality, presence: true
  validates :payment, presence: true, numericality: {greater_then_or_equal_to: 0}
end
