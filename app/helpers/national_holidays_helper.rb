module NationalHolidaysHelper
  def national_holiday_options
    Nationality.all.pluck('name', 'id')
  end
end
