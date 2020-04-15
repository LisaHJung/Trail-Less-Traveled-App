require "pry"
class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews

    def self.look_up_reviews(hiker_name)
       x= Hiker.where name: hiker_name
       binding.pry
    end 
        
end 

#[#<Review:0x00007fffc774cad8 id: 17, hiker_id: 28, hiking_trail_id: 11, rating: 10, user_comment: "Very beautiful!">,
 #<Review:0x00007fffc7991e60 id: 18, hiker_id: 29, hiking_trail_id: 12, rating: 9, user_comment: "Very easy!">,
 #<Review:0x00007fffc79917d0 id: 19, hiker_id: 30, hiking_trail_id: 12, rating: 5, user_comment: "Too much people">,
 #<Review:0x00007fffc7991488 id: 20, hiker_id: 29, hiking_trail_id: 11, rating: 10, user_comment: "The restaurant inside is amazing!">]

  #<Hiker:0x00007fffc800e3d8 id: 34, name: "lisa", member_since: nil, followers: nil, stats: nil>
=begin
  def self.trails_by_user_choice(traffic_input, location_input)
    HikingTrail.where traffic: traffic_input,location: location_input
 end 
end 
=end 