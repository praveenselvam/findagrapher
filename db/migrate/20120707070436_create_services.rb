class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :event

      t.timestamps
    end
  end
end
