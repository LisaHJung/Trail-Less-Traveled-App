class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews
end 
