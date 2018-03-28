class StudentRight < ActiveRecord::Base
  belongs_to :nationality
  belongs_to :religion
  belongs_to :country
  belongs_to :speciality
  
  has_many :restrictions
end
