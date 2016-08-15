class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
