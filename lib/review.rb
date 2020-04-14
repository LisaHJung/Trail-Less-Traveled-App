class Review < ActiveRecord::Base
    belongs_to :hiking_trail
    belongs_to :hiker
end 
