class Offering < ActiveRecord::Base
  attr_accessible :offering
  has_and_belongs_to_many :photographers
end
