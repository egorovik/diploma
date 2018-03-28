class Restriction < ActiveRecord::Base
  belongs_to :student_left
  belongs_to :student_right
end
