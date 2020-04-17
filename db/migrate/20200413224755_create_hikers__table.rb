class CreateHikersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :hikers do |t|
      t.string :name
    end
  end 
end
