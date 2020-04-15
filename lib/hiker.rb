require "pry"
class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews

    def self.look_up_reviews(hiker_name)
       x= Hiker.where name: hiker_name
       binding.pry
    end 

    #def write_reviews

        
end 
