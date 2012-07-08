class PhotographersServices < ActiveRecord::Migration
  def self.up
  	create_table :photographers_services, :id => false do |t|
  		t.references :service_id
  		t.references :photographer_id
  		t.timestamps
  	end
  end
  def self.down
  	drop_table :photographers_services
  end
end
