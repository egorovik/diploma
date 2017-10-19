class Speciality < ActiveRecord::Base
  has_many :referrals
  has_many :groups
  
  validates :section_number, presence: true
  validates :section_name, presence: true
  validates :group_number, presence: true
  validates :group_name, presence: true
  validates :subgroup_number, presence: true
  validates :subgroup_name, presence: true
  validates :speciality_code, presence: true
  validates :name, presence: true
  validates :edu_prog_code, presence: true
  validates :edu_area_code, presence: true
end
