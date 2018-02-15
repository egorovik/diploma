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
  
  def devise_message(str)
    case str
    when t('devise.password.user.send_instructions')
      hash = {'content' => str, 'type' => warning}
    when t('devise.password.user.no_token')
      hash = {'content' => str, 'type' => 'danger'}
    when t('devise.sessions.user.signed_out')
      hash = {'content' => str, 'type' => 'success'}
    when t('devise.sessions.user.signed_in')
      hash = {'content' => str, 'type' => 'success'}
    when t('devise.registrations.user.destroyed')
      hash = {'content' => str, 'type' => 'success'}
    when t('devise.registrations.user.signed_up')
      hash = {'content' => str, 'type' => 'success'}
    when t('devise.registrations.user.updated')
      hash = {'content' => str, 'type' => 'success'}
    when t('devise.registrations.user.signed_up_but_unconfirmed')
      hash = {'content' => str, 'type' => 'success'}
    when t('devise.failure.user.invalid')
      hash = {'content' => str, 'type' => 'danger'}
    when t('devise.failure.user.not_found_in_database')
      hash = {'content' => str, 'type' => 'danger'}
    when t('devise.confirmations.user.confirmed')
      hash = {'content' => str, 'type' => 'success'}
    else
      hash = {'content' => str, 'type' => 'default'}
    end
    return hash
  end
  
  def value_for_form_text_field(str)
    if !(params['search'].nil?)
      if !(params['search'][str].nil?)
        return params['search'][str]
      end
    end
    return nil
  end
  
  def is_search_params_empty?
    if !(params['search'].nil?)
      flag = true
      params['search'].each do |p|
        if !(p[1].empty?)
          flag = false
          break
        end
      end
      return flag
    else
      return true
    end
  end
  
end
