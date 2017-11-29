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
      if !(params['search']['country.long_name'].nil?) and !(params['search']['country.long_name'].empty?)
        result = result.where("long_name ilike ?", "%#{params['search']['country.long_name']}%")
      end
      if !(params['search']['country.alpha2'].nil?) and !(params['search']['country.alpha2'].empty?)
        result = result.where("alpha2 ilike ?", "%#{params['search']['country.alpha2']}%")
      end
      if !(params['search']['country.alpha3'].nil?) and !(params['search']['country.alpha3'].empty?)
        result = result.where("alpha3 ilike ?", "%#{params['search']['country.alpha3']}%")
      end
      if !(params['search']['country.country_code'].nil?) and !(params['search']['country.country_code'].empty?)
        result = result.where("country_code ilike ?", "%#{params['search']['country.country_code']}%")
      end
    end
    return result
  end
end
