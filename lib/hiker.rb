require "pry"
class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews
   
    def self.create_review(hiker, reviewer_trail_input, reviewer_rating_input, reviewer_comment_input)
      Review.create(hiker: hiker, hiking_trail_id: reviewer_trail_input, rating: reviewer_rating_input, user_comment: reviewer_comment_input)
    end 
    
    def reviews_by_hiker
      self.reviews
    end 

    def trails_by_hiker
      self.hiking_trails
    end 

    def delete_review_by_trail_name(trail_name)
      review_to_delete =reviews_by_hiker.where hiking_trail: trail_name
      binding.pry
      review_to_delete.delete
    end 
    
    


        
end 



        

