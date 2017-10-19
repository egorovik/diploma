class Country < ActiveRecord::Base
  has_many :students
  
  validates :short_name, presence: true
  validates :long_name, presence: true
  validates :alpha2, presence: true
  validates :alpha3, presence: true
  validates :country_code, presence: true
end
