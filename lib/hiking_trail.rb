require 'pry'
class HikingTrail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews

    def self.trails_by_user_choice(traffic_input,location_input, length_input,difficulty_input,elevation_input)
      matching_trails =HikingTrail.where traffic: traffic_input,location: location_input, distance: length_input, difficulty_level: difficulty_input, elevation: elevation_input
      
      if matching_trails.length == 0
          puts "There are no trails that match your preferences.Try again."
      else
          matching_trails.each do |trail|
          puts "Here are our trail recommendations based on your preferences"
          puts "Trail name: #{trail.name}; Location:#{trail.location}; Difficulty Level: #{trail.difficulty_level}; Trail Length: #{trail.distance} miles; Trail Traffic: #{trail.traffic}; Elevation: #{trail.elevation} feet"
      end
    end 
  end 
end 

