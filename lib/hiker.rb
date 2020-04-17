require "pry"
class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :hiking_trails, through: :reviews
   
    def self.create_review(hiker, reviewer_trail_input, reviewer_rating_input, reviewer_comment_input)
      Review.create(hiker: hiker, hiking_trail_id: reviewer_trail_input, rating: reviewer_rating_input, user_comment: reviewer_comment_input)
    end 
    
    def reviews_by_hiker
      self.reviews
    end 

    def trails_by_hiker
      self.hiking_trails
    end 
  
    def self.look_up_reviews(hiker_name)
       x= Hiker.where name: hiker_name
    end 

    def delete_review_by_trail_name(trail_name)
      matching_trail_name = hiking_trails.where name: trail_name
      review_to_delete = reviews_by_hiker.find_by(hiking_trail_id: matching_trail_name.ids)
      review_to_delete.delete
      puts "Your review has been deleted."
    end 
 
    def edit_review_by_trail_name(trail_name_to_edit, rating_to_edit, comment_to_edit)
      matching_trail_name = hiking_trails.find_by name: trail_name_to_edit
      review_to_edit = reviews_by_hiker.find_by(hiking_trail_id: matching_trail_name.id)
      updated_review= review_to_edit.update(rating: rating_to_edit, user_comment: comment_to_edit)
    end     

#     def update_review_array_for_hiker
#       edit_review_by_trail_name
#       review_to_update = Review.where id == updated_review.id
#       review_to_update.update_columns(rating: rating_to_edit, user_comment: comment_to_edit)
#     end 
end 



