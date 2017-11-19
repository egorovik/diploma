module ReferralsHelper
  def student_options
    arr = []
    Student.all.each do |s|
      arr << ["#{s.ln} #{s.fn} #{s.sn}", s.id]
    end
    return arr
  end
end
