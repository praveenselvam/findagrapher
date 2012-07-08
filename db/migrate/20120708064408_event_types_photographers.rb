class EventTypesPhotographers < ActiveRecord::Migration
  def self.up
  	create_table :event_types_photographers, :id => false do |t|
  		t.references :event_type
  		t.references :photographer
  	end
  end
  def self.down
  	drop_table :event_types_photographers
  end
end
