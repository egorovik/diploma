module StudentsHelper
  
  def passport_options
    arr = []
    Passport.all.each do |p|
      arr << ["#{p.serial} #{p.number}", p.id]
    end
    return arr
  end
  
  def restriction_name(str)
    case str
    when "same_hostel"
      return "заселение в одном общежитии"
    when "same_group"
      return "зачисление в одну группу"
    end
  end
  
end
