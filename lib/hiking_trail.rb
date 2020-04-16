require 'pry'
class HikingTrail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews

    def self.trails_by_user_choice(traffic_input,location_input, length_input,difficulty_input,elevation_input)
        HikingTrail.where traffic: traffic_input,location: location_input, distance: length_input, difficulty_level: difficulty_input, elevation: elevation_input
     end 
end 




