class Review < ActiveRecord::Base
    belongs_to :hiker
    belongs_to :hiking_trail
    
    def self.create_review(hiker, reviewer_trail_input, reviewer_rating_input, reviewer_comment_input)
    
        Review.create(hiker: hiker, hiking_trail: reviewer_trail_input, rating: reviewer_rating_input, user_comment: reviewer_comment_input)
      end 



end

#<Hiker:0x00007ffff0f83868 id: 101, name: "", member_since: nil, followers: nil, stats: nil>
#<Review:0x00007ffff088a660 id: 29, hiker_id: 80, hiking_trail_id: 17, rating: 10, user_comment: "Very beautiful!">,

#From the review, create a method which woudl hiker_name argument and return hiker id whose name value matches hiker_name


