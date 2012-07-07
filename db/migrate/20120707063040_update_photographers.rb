class UpdatePhotographers < ActiveRecord::Migration
  def change
  	change_table :photographers do |t|
  		t.string :email
  		t.string :place
  	end
  end
end
