class CreateReviewsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :hiker, foreign_key: true
      t.references :hiking_trail, foreign_key: true
      t.integer :rating
      t.string :user_comment
    end 
  end
end

