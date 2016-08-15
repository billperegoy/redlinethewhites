class CreateSegmentConnectors < ActiveRecord::Migration
  def change
    create_table :segment_connectors do |t|
      t.integer :user_id
      t.integer :trail_segment_id

      t.timestamps null: false
    end
  end
end
