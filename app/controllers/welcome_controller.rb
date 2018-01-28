class WelcomeController < ApplicationController
  def index
  end
  
  def get_holidays
    nh = NationalHoliday.all.pluck(:date)
    rh = ReligionHoliday.all.pluck(:date)
    @n = []
    @r = []
    nh.each do |n|
      @n << n.day if n.month == params['month'].to_i + 1
    end
    rh.each do |r|
      @r << r.day if r.month == params['month'].to_i + 1
    end
    @n = @n.sort.uniq.join(',')
    @r = @r.sort.uniq.join(',')
  end
end
