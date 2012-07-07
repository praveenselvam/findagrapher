class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :event

      t.timestamps
    end
  end
end
