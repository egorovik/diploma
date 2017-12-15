class Speciality < ActiveRecord::Base
  has_many :referrals
  has_many :groups
  
  validates :section_number, presence: true
  validates :section_name, presence: true
  validates :group_number, presence: true
  validates :group_name, presence: true
  validates :subgroup_number, presence: true
  validates :subgroup_name, presence: true
  validates :speciality_code, presence: true
  validates :name, presence: true
  validates :edu_prog_code, presence: true
  validates :edu_area_code, presence: true
  
  def self.search(params)
    result = self.all
    if !(params["search"].nil?)
      if !(params['search']['speciality.section_number0'].nil?) and !(params['search']['speciality.section_number0'].empty?)
        result = result.where("section_number >= ?", "#{params['search']['speciality.section_number0']}")
      end
      if !(params['search']['speciality.section_number1'].nil?) and !(params['search']['speciality.section_number1'].empty?)
        result = result.where("section_number <= ?", "#{params['search']['speciality.section_number1']}")
      end
      if !(params['search']['speciality.section_name'].nil?) and !(params['search']['speciality.section_name'].empty?)
        result = result.where("section_name ilike ?", "%#{params['search']['speciality.section_name']}%")
      end
      if !(params['search']['speciality.group_number0'].nil?) and !(params['search']['speciality.group_number0'].empty?)
        result = result.where("group_number >= ?", "#{params['search']['speciality.group_number0']}")
      end
      if !(params['search']['speciality.group_number1'].nil?) and !(params['search']['speciality.group_number1'].empty?)
        result = result.where("group_number <= ?", "#{params['search']['speciality.group_number1']}")
      end
      if !(params['search']['speciality.group_name'].nil?) and !(params['search']['speciality.group_name'].empty?)
        result = result.where("group_name ilike ?", "%#{params['search']['speciality.group_name']}%")
      end
      if !(params['search']['speciality.subgroup_number'].nil?) and !(params['search']['speciality.subgroup_number'].empty?)
        result = result.where("subgroup_number ilike ?", "%#{params['search']['speciality.subgroup_number']}%")
      end
      if !(params['search']['speciality.subgroup_name'].nil?) and !(params['search']['speciality.subgroup_name'].empty?)
        result = result.where("subgroup_name ilike ?", "%#{params['search']['speciality.subgroup_name']}%")
      end
      if !(params['search']['speciality.speciality_code'].nil?) and !(params['search']['speciality.speciality_code'].empty?)
        result = result.where("speciality_code ilike ?", "%#{params['search']['speciality.speciality_code']}%")
      end
      if !(params['search']['speciality.name'].nil?) and !(params['search']['speciality.name'].empty?)
        result = result.where("name ilike ?", "%#{params['search']['speciality.name']}%")
      end
      if !(params['search']['speciality.edu_prog_code'].nil?) and !(params['search']['speciality.edu_prog_code'].empty?)
        result = result.where("edu_prog_code ilike ?", "%#{params['search']['speciality.edu_prog_code']}%")
      end
      if !(params['search']['speciality.edu_area_code'].nil?) and !(params['search']['speciality.edu_area_code'].empty?)
        result = result.where("edu_area_code ilike ?", "%#{params['search']['speciality.edu_area_code']}%")
      end
    end
    return result
  end
end
