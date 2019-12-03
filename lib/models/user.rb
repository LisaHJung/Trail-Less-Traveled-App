class User < ActiveRecord::Base
    has_many :cats
end