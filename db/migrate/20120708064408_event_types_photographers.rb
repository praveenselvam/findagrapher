class EventTypesPhotographers < ActiveRecord::Migration
  def self.up
  	create_table :event_types_photographers, :id => false do |t|
  		t.references :event_type_id
  		t.references :photographer_id
  		t.timestamps
  	end
  end
  def self.down
  	drop_table :event_types_photographers
  end
end
