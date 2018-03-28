class Restriction < ActiveRecord::Base
  belongs_to :student_left
  belongs_to :student_right
  
  accepts_nested_attributes_for :student_left
  accepts_nested_attributes_for :student_right
end
