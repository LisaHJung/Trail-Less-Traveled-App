class Review < ActiveRecord::Base
    belongs_to :hiker
    belongs_to :hiking_trail
    
    def self.create_review(hiker, reviewer_trail_input, reviewer_rating_input, reviewer_comment_input)
    
        Review.create(hiker: hiker, hiking_trail: reviewer_trail_input, rating: reviewer_rating_input, user_comment: reviewer_comment_input)
      end 
end



