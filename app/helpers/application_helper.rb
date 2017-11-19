module ApplicationHelper
  def curr_age(date)
    t = Time.now
    return t.year - date.year
  end
  
  def field(note)
    if note
      return note
    else
      return "не заполнено"
    end
  end
  
  def ru_date(d)
    return "#{d.day}.#{d.month}.#{d.year}"
  end
  
  def ru_day_month(d)
    str = d.day.to_s
    case d.month
    when 1
      str = str + " января"
    when 2
      str = str + " февраля"
    when 3
      str = str + " марта"
    when 4
      str = str + " апреля"
    when 5
      str = str + " мая"
    when 6
      str = str + " июня"
    when 7
      str = str + " июля"
    when 8
      str = str + " августа"
    when 9
      str = str + " сентября"
    when 10
      str = str + " октября"
    when 11
      str = str + " ноября"
    when 12
      str = str + " декабря"
    end
    return str
  end
  
  def sname(student)
    str = student.ln + " "
    str = str + student.fn[0] + '.'
    str = str + " " + student.sn[0] + "." if student.sn
    return str
  end
  
  def sname_full(student)
    str = student.ln + " "
    str = str + student.fn + ' '
    str = str + " " + student.sn if student.sn
    return str
  end
  
end
