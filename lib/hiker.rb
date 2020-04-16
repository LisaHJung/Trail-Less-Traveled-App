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
#<Review:0x00007fffe4cd24b8 id: 39, hiker_id: 127, hiking_trail_id: 18, rating: 5, user_comment: "Lovely!">]
    def delete_review_by_trail_name(trail_name)
      matching_trail_name =hiking_trails.where name: trail_name
      review_to_delete = reviews_by_hiker.find_by(hiking_trail_id: matching_trail_name.ids)
      review_to_delete.delete
      puts "Your review has been deleted."
      #binding.pry
    end 
    
    


        
end 





