require 'pry'
class HikingTrail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews

<<<<<<< HEAD
    def self.trails_by_user_choice(traffic_input, location_input, length_input, difficulty_input)
        HikingTrail.all.where traffic: traffic_input, location: location_input, distance: length_input, difficulty_level: difficulty_input
    end

   
end 

=======
    def self.trails_by_user_choice(traffic_input,location_input, length_input,difficulty_input,elevation_input)
        HikingTrail.where traffic: traffic_input,location: location_input, distance: length_input, difficulty_level: difficulty_input, elevation: elevation_input
     end 
end 


>>>>>>> 33e1e8cb60d0a94d490e12680949468bcf8ffc43


