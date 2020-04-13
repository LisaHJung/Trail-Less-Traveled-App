class CreateHikingTrailsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :hiking_trails do |t|
      t.string :name
      t.string :location
      t.string :difficulty_level
      t.integer :distance
      t.string :traffic
      t.integer :elevation
      t.string :rout_type
    end
  end
end
