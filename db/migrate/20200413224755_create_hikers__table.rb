class CreateHikersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :hikers do |t|
      t.string :name
      t.datetime :member_since
      t.integer :followers
      t.string :stats
    end
  end 
end
