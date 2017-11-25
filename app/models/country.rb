class Country < ActiveRecord::Base
  has_many :students
  
  validates :short_name, presence: true
  validates :long_name, presence: true
  validates :alpha2, presence: true
  validates :alpha3, presence: true
  validates :country_code, presence: true
  
  def self.search(params)
    result = self.all
    if !(params["search"].nil?)
      if !(params['search']['country.short_name'].nil?) and !(params['search']['country.short_name'].empty?)
        result = result.where("short_name ilike ?", "%#{params['search']['country.short_name']}%")
      end
    end
    return result
  end
end
