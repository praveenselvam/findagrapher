class Photographer < ActiveRecord::Base
  attr_accessible :name, :photo, :portfolio, :place, :email

  validates :name, :presence => true
  validates :place, :presence => true
  validates :email, :presence => true
  
end
