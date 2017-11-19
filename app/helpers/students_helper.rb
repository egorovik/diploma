module StudentsHelper
  
  def passport_options
    arr = []
    Passport.all.each do |p|
      arr << ["#{p.serial} #{p.number}", p.id]
    end
    return arr
  end
  
end
