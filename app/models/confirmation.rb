class Confirmation < ActiveRecord::Base
  belongs_to :document
  belongs_to :country
end
