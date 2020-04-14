class Review < ActiveRecord::Base
    belongs_to :hiker
    belongs_to :hiking_trail
end

