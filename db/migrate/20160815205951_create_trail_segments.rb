class CreateTrailSegments < ActiveRecord::Migration
  def change
    create_table :trail_segments do |t|
      t.string :start
      t.string :end
      t.float :distance
      t.integer :trail_id

      t.timestamps null: false
    end
  end
end
