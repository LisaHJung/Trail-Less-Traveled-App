class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews

    def self.reviews_by_hiker(hiker_name)
        reviews_by_hiker = Review.all.where id: hiker_name.id
        binding.pry
        reviews_by_hiker
    end

# [#<Review:0x00007fd98d247520 id: 81, hiker_id: 120, hiking_trail_id: 46, rating: 10, user_comment: "Very beautiful!">,
#  #<Review:0x00007fd98c3d8200 id: 82, hiker_id: 121, hiking_trail_id: 47, rating: 9, user_comment: "Very easy!">,
#  #<Review:0x00007fd98c3d8138 id: 83, hiker_id: 122, hiking_trail_id: 47, rating: 5, user_comment: "Too much people">,
#  #<Review:0x00007fd98c3d8070 id: 84, hiker_id: 121, hiking_trail_id: 46, rating: 10, user_comment: "The restaurant inside is amazing!">]


end 

