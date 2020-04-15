class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews

    def self.reviews_by_hiker(hiker_name)
        hiker = Hiker.where name: hiker_name
        all_reviews_by_hiker = Review.all.where hiker_id: hiker.ids
    end

    def self.trails_by_hiker(hiker_name)
        hiker = Hiker.where name: hiker_name
        reviews_by_hiker = Review.all.where hiker_id: hiker.ids
        trail_id = reviews_by_hiker.map {|rev| rev.hiking_trail_id}
        trails_by_hiker = HikingTrail.where id: trail_id
    end
    
    
    def self.delete_all_reviews_by_hiker(hiker_name)
        hiker = Hiker.where name: hiker_name
        all_reviews_by_hiker = Review.all.where hiker_id: hiker.ids
        reviews_by_hiker.delete_all
    end

    def self.delete_review_by_trail_name(trail_name)
        trail_id = trail_id_by_name(trail_name)
        trail_to_delete = Review.where hiking_trail_id: trail_id
        trail_to_delete.delete
    end
    
    def self.hiker_id_by_name(hiker_name)
        hiker = Hiker.where name: hiker_name
        hiker_id = hiker.ids
    end

    def self.trail_id_by_name(hiking_input)
        trail = HikingTrail.where name: hiking_input
        trail_id = trail.ids
    end


    def self.create_a_new_review(hiker_id: nil, hiking_trail_id: nil, rating: nil, user_comment: nil) 
        binding.pry
            Review.create
    end

# [#<Review:0x00007fd98d247520 id: 81, hiker_id: 120, hiking_trail_id: 46, rating: 10, user_comment: "Very beautiful!">,
#  #<Review:0x00007fd98c3d8200 id: 82, hiker_id: 121, hiking_trail_id: 47, rating: 9, user_comment: "Very easy!">,
#  #<Review:0x00007fd98c3d8138 id: 83, hiker_id: 122, hiking_trail_id: 47, rating: 5, user_comment: "Too much people">,
#  #<Review:0x00007fd98c3d8070 id: 84, hiker_id: 121, hiking_trail_id: 46, rating: 10, user_comment: "The restaurant inside is amazing!">]


end 

