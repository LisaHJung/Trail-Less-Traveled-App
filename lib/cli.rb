# just a class, not a model. we do not inherit from database.
    # so you need to write out instantiation methods as we have learned before.
class Cli
    attr_reader :hiker

    def welcome_menu
        puts "Welcome to Trail Less Traveled."
        puts "During this crazy pandemic, us avid hikers and outdoor enthusiasts could find ourselves going stir crazy."
        puts "In times, where everyone and their mothers are heading to the outdoors to escape cabin fever, what is a hiker to do to find some peace and quiet on the trail?"
        puts "Trail Less Traveled app has got you covered. Use this app to find the least busy trail based on your preference of location, trail difficulty, trail length, and reviews."
        puts "Keep calm and hike on while practicing safe social distancing."
        puts "What is your name?"
        
        hiker_name = gets.chomp
        set_hiker(hiker_name)
    end

    def set_hiker(hiker_name)
        @hiker = Hiker.find_or_create_by(name: hiker_name)
        user_path
    end 

 
    def user_path
        puts "What do you want to do? Choose one option from the following:"
        puts "1 (I want to find a hiking trail.)"
        puts "2 (I want to leave a review for a trail)"
        puts "3 (I want to see all of my reviews)"
        puts "4 (I want to see all the trails I have reviewed)"
        user_path_input= gets.chomp.downcase

        if user_path_input == "1"
            collect_hiker_choices_trail

        elsif user_path_input == "2"
            collect_hiker_inputs_review
        
        elsif user_path_input == '3'
            binding.pry
            hiker.reviews_by_hiker.map do |review|
                puts "You have reviewed #{review.hiking_trail.name} trail and gave it the rating of #{review.rating}. These are your comments: #{review.user_comment}"
            end
            puts "1 (I want to edit my previous review(s))"
            puts "2 (I want to delete my previous review(s))"
            user_path_input_3 = gets.chomp.downcase
                if user_path_input_3 == "1"
                    puts "please enter the trail name of the review you want to edit"
                     trail_name_to_edit = gets.chomp   
             
                elsif  user_path_input_3 == "2"
                    puts "please enter the trail name of the review you want to delete"
                    trail_name_to_delete = gets.chomp
                        hiker.delete_review_by_trail_name(trail_name_to_delete)
                end 

        elsif user_path_input == "4"
            trail_array = []
            hiker.trails_by_hiker.map do |trail|
               trail_array << trail.name 
            end.join( ) # WE WILL FIX THIS IN THE END
            puts "You have hiked in: #{trail_array}"
        end 
    end

    def collect_hiker_choices_trail
        traffic_input = traffic_choice
        length_input = length_choices
        difficulty_input = difficulty_choices

        #elevation_input = elevation_choices
        x = HikingTrail.trails_by_user_choice(traffic_input, location_input, length_input, difficulty_input)
        #binding.pry
    end

    def traffic_choices
       puts "Choose current traffic level of a hiking trail you want to get your hike on from the following:"
       puts "High (ex. Wash park on a sunny Saturday)"
       puts "Medium (ex. I don't mind seeing some friendly faces on the trail)"
       puts "Desolate (ex. Qurantine is a style of my life. I don't want to see anyone on the trail)"
       
       gets.chomp.downcase
       #location_choices(hiker_choice)
    end

    def location_choices
        puts "Choose from following city you want to go hike in:"
        puts "Boulder"
        puts "Denver"
        puts "Golden"
       
        gets.chomp.downcase
      
    end 

    def length_choices
        puts "Choose trail length of your preference from the following (in miles):"
        puts 0..3 
        puts 3..5
        puts 5..100

        gets.chomp.downcase
    end

    def difficulty_choices
        puts "Choose trail difficulty of your preference from the following:"
        puts "Easy"
        puts "Medium"
        puts "Difficult"

        gets.chomp.downcase
        #view_all_reviews(hiker_name)
    end

    # def elevation_choices
    #     puts "Choose elevation of your preferense from following (in feet):"
    #     puts "7000-8000"
    #     puts "8000-10000"
    #     puts "10000+"
    
    #     gets.chomp.downcase
    # end

    # def rating_choices
    #     puts "Choise ratind of your preference from the following (1-5 star rating):"
    #     puts 1
    #     puts 2
    #     puts 3
    #     puts 4
    #     puts 5
    # end

    # def view_all_reviews(hiker_name)
    #     puts "There is all yours reviews:"
    #     Hiker.reviews_by_hiker
    # end


        elevation_input = elevation_choices
        #rating_input = rating_choices
        x= HikingTrail.trails_by_user_choice(traffic_input,location_input, length_input, difficulty_input, elevation_input)
      
    end   

    def collect_hiker_inputs_review
        reviewer_trail_input = new_review_trail_name
            if reviewer_trail_input 
                reviewer_rating_input = new_review_rating
                reviewer_comment_input = new_review_comment
                y=Review.create_review(hiker, reviewer_trail_input, reviewer_rating_input, reviewer_comment_input)
          
            else 
                puts "Check your spelling and capitalization of trail name. Try again."
                # map through all trails and print them out. 
                collect_hiker_inputs_review
            end 
        
    end 

    def traffic_choices
       puts "Choose your preferred level of traffic of a hiking trail from the following:"
       puts "High (ex. Wash park on a sunny Saturday)"
       puts "Medium (ex. I don't mind seeing some friendly faces on the trail.)"
       puts "Desolate (ex. I want to avoid human contact as much as possible.)"
       gets.chomp.downcase 
    end

    def location_choices
        puts "Choose city of your preference from the following:"
        puts "Boulder"
        puts "Denver"
        puts "Golden"
        gets.chomp.downcase
    end 

    def length_choices
       puts "Choose trail length of your preference from the following(in miles):"
       puts "0-3"
       puts "3-5"
       puts "5-10"
       length_input = gets.chomp    
            if length_input == "0-3"
                length_input_converted = 0..3
            elsif length_input == "3-5" 
                length_input_converted = 3..5
            else 
                length_input_converted = 5..10
            end
    end 

    def difficulty_choices
        puts "Choose trail difficulty of your preference from the following:"
        puts "Easy"
        puts "Medium"
        puts "Difficult"
        gets.chomp.downcase
    end 

    def elevation_choices
        puts "Choose elevation of your preference from the following(in feet)"
        puts "7000-8000"
        puts "8000-10,000"
        puts "10,000-14,000"
        elevation_input = gets.chomp    
            if elevation_input == "7000-8000"
                elevation_input_converted = 7000..8000
            elsif elevation_input == "8000-10,000" 
                elevation_input_converted = 8000..10000
            else 
                elevation_input_converted = 10,000..14,000
            end
    end 

    def new_review_trail_name
        puts "Please write the name of the trail you want to review"
        reviewer_trail_input = gets.chomp
        binding.pry
        HikingTrail.find_by name: reviewer_trail_input
    end 

    def new_review_rating
        puts "Please rate the trail on a scale from 1 to 5 (1 - I don't recommend this trail. 2- I highly recommend this trail.)"
        reviewer_rating_input = gets.chomp
    end 

    def new_review_comment
        puts "Please leave a comment on what you thought of the trail"
        reviewer_comment_input = gets.chomp
    end 


   

=begin
    def rating_choices
        puts "Choose rating of your preference from the following (1-5 star rating, 1-don't recommend 5-highly recommend):"
        puts 1
        puts 2
        puts 3
        puts 4
        puts 5
        gets.chomp.downcase
    end 
=end 
end 