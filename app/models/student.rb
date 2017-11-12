class Student < ActiveRecord::Base
  belongs_to :passport
  belongs_to :country
  belongs_to :nationality
  belongs_to :religion
  belongs_to :group
  belongs_to :room
  belongs_to :referral
  has_many :documents
  has_many :educations
  
  validates :ln, presence: true
  validates :fn, presence: true
  validates :bday, presence: true, uniqueness: {scope: [:ln, :fn, :sn, :sex]}
  validates :sex, presence: true, inclusion: {in: [?м, ?ж]}
  validates :country, presence: true
  
end
