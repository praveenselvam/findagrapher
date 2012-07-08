class Photographer < ActiveRecord::Base
  attr_accessible :name, :photo, :portfolio, :place, :email, :event_list, :offering_list, :service_list

  validates :name, :presence => true
  validates :place, :presence => true
  validates :email, :presence => true

  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :offerings
  has_and_belongs_to_many :services

  attr_accessor :event_list
  attr_accessor :offering_list
  attr_accessor :service_list
  
  after_save :update_event_types
  after_save :update_offering_list
  after_save :update_service_list

  private

  def update_event_types
  	event_types.delete_all
  	selected_events = event_list.nil? ? [] : event_list.keys.collect{ |id| EventType.find_by_id(id)}
  	selected_events.each { |event| self.event_types << event}
  end
  
  def update_offering_list
  	offerings.delete_all
  	selected_offerings = offering_list.nil? ? [] : offering_list.keys.collect{ |id| Offering.find_by_id(id)}
  	selected_offerings.each { |offering| self.offerings << offering}
  end
  
  def update_service_list
  	services.delete_all
  	selected_services = service_list.nil? ? [] : service_list.keys.collect{ |id| Service.find_by_id(id)}
  	selected_services.each { |service| self.services << service}
  end
end
