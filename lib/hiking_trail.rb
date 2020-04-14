class HikingTrail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews
end