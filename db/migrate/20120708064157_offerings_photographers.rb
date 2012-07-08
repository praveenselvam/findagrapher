class OfferingsPhotographers < ActiveRecord::Migration
  def self.up
  	create_table :offerings_photographers, :id => false do |t|
  		t.references :offering
  		t.references :photographer
  	end
  end
  def self.down
  	drop_table :offerings_photographers
  end
end
