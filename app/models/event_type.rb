class EventType < ActiveRecord::Base
  attr_accessible :event

  has_and_belongs_to_many :photographers
end
