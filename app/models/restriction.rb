class Restriction < ActiveRecord::Base
  belongs_to :student_left
  belongs_to :student_right
  
  accepts_nested_attributes_for :student_left
  accepts_nested_attributes_for :student_right
  
  def find_left_student
    arr = []
    skip = ['id', 'created_at', 'updated_at']
    hash = {}
    self.student_left.attribute_names.each do |n|
      if !skip.include?(n)
        if self.student_left[n]
          if !self.student_left[n].blank?
            hash[n] = self.student_left[n]
          end
        end
      end
    end
    s = Student.all
    hash.each do |h|
      s = s.where("#{h[0]} = #{h[1]}")
    end
    return s.ids
  end
  
  def find_right_student
    arr = []
    skip = ['id', 'created_at', 'updated_at']
    hash = {}
    self.student_right.attribute_names.each do |n|
      if !skip.include?(n)
        if self.student_right[n]
          if !self.student_right[n].blank?
            hash[n] = self.student_right[n]
          end
        end
      end
    end
    s = Student.all
    hash.each do |h|
      s = s.where("#{h[0]} = #{h[1]}")
    end
    return s.ids
  end
  
  def check_ltr(student)
    arr = self.restriction.split
    ids = find_left_student
    if ids.include?(student.id)
      result = []
      arr.each do |a|
        result = result | eval("student." + a)
      end
      right = self.find_right_student
      return result & right
    end
  end
  
  def check_rtl(student)
    arr = self.restriction.split
    ids = find_right_student
    if ids.include?(student.id)
      result = []
      arr.each do |a|
        result = result | eval("student." + a)
      end
      left = self.find_left_student
      return result & left
    end
  end
  
  def check(student)
    return check_ltr(student).to_a | check_rtl(student).to_a
  end
end
