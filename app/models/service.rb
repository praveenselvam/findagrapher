class Service < ActiveRecord::Base
  attr_accessible :service
  has_and_belongs_to_many :photographers
end
