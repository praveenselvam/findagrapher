class CreateShoots < ActiveRecord::Migration
  def change
    create_table :shoots do |t|
      t.string :name

      t.timestamps
    end
  end
end
