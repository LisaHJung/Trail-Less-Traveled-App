class HikingTrail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews

    def self.trails_by_user_choice(traffic_input, location_input)
        HikingTrail.all.where traffic: traffic_input, location: location_input
    end

   
end 



