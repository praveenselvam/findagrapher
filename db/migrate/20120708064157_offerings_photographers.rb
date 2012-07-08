class OfferingsPhotographers < ActiveRecord::Migration
  def self.up
  	create_table :offerings_photographers, :id => false do |t|
  		t.references :offering_id
  		t.references :photographer_id
  		t.timestamps
  	end
  end
  def self.down
  	drop_table :offerings_photographers
  end
end
