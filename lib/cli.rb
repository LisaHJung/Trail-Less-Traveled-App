class Cli
    attr_reader :hiker
    $prompt = TTY::Prompt.new(symbols: {marker: '⛰️'})
    def welcome_menu
        welcome_user
        puts "Welcome to Trail Less Traveled."
        puts "\nDuring this crazy pandemic, us avid hikers and outdoor enthusiasts could find ourselves going stir crazy."
        puts "In times, where everyone and their mothers are heading to the outdoors to escape cabin fever, what is a hiker to do to find some peace and quiet on the trail?"
        puts "\nTrail Less Traveled app helps you find the least busy trail based on your preference of trail traffic, location, difficulty, length, and elevation."
        puts "Keep calm and hike on while practicing safe social distancing."
        
        prompt = TTY::Prompt.new
        hiker_name= prompt.ask("\nWhat is your name?") #, default: ENV['USER']
        set_hiker(hiker_name)
    end
   

    def set_hiker(hiker_name)
        @hiker = Hiker.find_or_create_by(name: hiker_name)  
        user_path
    end 
 
    def user_path
        banner
        puts "Hi #{hiker.name}!"
        choices = ["Find a hiking trail", "Leave a review for a trail", "See all of my reviews", "See all of the trail I have reviewed", "Exit this app"]
        user_path_input = $prompt.select("\nWhat do you want to do?", choices)
            
        case user_path_input
            when "Find a hiking trail"  
                system "clear"
                banner
                collect_hiker_choices_trail         
            when "Leave a review for a trail"
                system "clear"
                banner
                collect_hiker_inputs_review
            when "See all of my reviews"
                system "clear"
                banner
                see_all_reviews   
            when "See all of the trail I have reviewed"
                system "clear"
                banner
                see_all_trails
        else
            system "clear"
            goodbye
            puts "Thank you for using our App. Have a great day!"
        end
    end

    def collect_hiker_choices_trail
        traffic_input = traffic_choices
        location_input = location_choices 
        length_input = length_choices
        difficulty_input = difficulty_choices
        elevation_input = elevation_choices
        system "clear"
        banner
        x = HikingTrail.trails_by_user_choice(traffic_input, location_input, length_input, difficulty_input, elevation_input)
        traffic_input = $prompt.select("Press enter to continue",["Enter"])
        user_path
    end

    def collect_hiker_inputs_review
        reviewer_trail_input = new_review_trail_name
            if reviewer_trail_input 
                reviewer_rating_input = new_review_rating
                reviewer_comment_input = new_review_comment
                y=Review.create_review(hiker, reviewer_trail_input, reviewer_rating_input, reviewer_comment_input)
                puts "Thank you for your review. Your review is now live for other users to view."
                hiker.reload
                user_path
            else 
                puts "Check your spelling and capitalization of trail name. Try again."
                # map through all trails and print them out. 
                collect_hiker_inputs_review
            end 
        
    end 

    def collect_hiker_inputs_update_review
        trail_name_to_edit = specify_trail_name_to_edit
        rating_to_edit = edit_existing_rating
        comment_to_edit = edit_existing_comment
       
        hiker.edit_review_by_trail_name(trail_name_to_edit, rating_to_edit,comment_to_edit)
        hiker.reload
        puts "\nThank you! Your review is now live for our users to see."
        user_path
    end 


    def traffic_choices
        traffic_selection = ["High", "Medium", "Desolate"]
        traffic_input = $prompt.select("Choose your preferred level of traffic of a hiking trail", traffic_selection).downcase
    end

    def location_choices
        location_selection = ["Boulder", "Denver", "Golden"]
        $prompt.select("Choose city of your preference", location_selection).downcase
    end 

    def length_choices
        length_selection = ["0-3", "3-5", "5-10"]
        length_input = $prompt.select("Choose trail length of your preference(in miles)", length_selection)

        case length_input 
            when "0-3"
                length_input_converted = 0..3
            when "3-5" 
                length_input_converted = 3..5
            else 
                length_input_converted = 5..10
            end
    end 

    def difficulty_choices
        difficulty_selection = ["Easy", "Medium", "Difficult"]
        difficulty_input = $prompt.select("Choose trail difficulty of your preference", difficulty_selection).downcase
    end 

    def elevation_choices
        elevation_selection = ["7,000-8,000", "8,000-10,000", "10,000-15,000"]
        elevation_input = $prompt.select("Choose elevation of your preference(in feet)", elevation_selection)
      
           case elevation_input 
                when "7,000-8,000"
                        elevation_input_converted = 7000..8000
                when "8,000-10,000" 
                        elevation_input_converted = 8000..10000
                else 
                    elevation_input_converted = 10000..15000
            end
    end 

    def new_review_trail_name
        trail_selections = HikingTrail.all.map {|trail| trail.name}
        reviewer_trail_input = $prompt.select("\nPlease choose the name of trail that you want to review", trail_selections)
        #puts "Please write the name of the trail you want to review"
        # reviewer_trail_input = gets.chomp
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
   
    def see_all_reviews
        if hiker.reviews_by_hiker.length == 0
            puts "You currently have not written any reviews."
        else
            hiker.reviews_by_hiker.map do |review|
            puts "You have reviewed #{review.hiking_trail.name} trail and gave it the rating of #{review.rating}. These are your comments: #{review.user_comment}"
            end 
        end
        update_review_selection = ["Edit my previous review(s)", "Delete my previous review(s)", "Main menu"]
        sub_reviews_menu = $prompt.select("\nWhat do you want to do?", update_review_selection).downcase
        
            case sub_reviews_menu 
                when "edit my previous review(s)"
                    system "clear"
                    banner
                if hiker.reviews_by_hiker.length == 0
                    puts "You have not written any reviews yet. Please go back to the main menu if you want to share a review!"
                    user_path
                else
                    collect_hiker_inputs_update_review
                end 
                when "delete my previous review(s)"
                    system "clear"
                    banner
                    if hiker.reviews_by_hiker.length == 0
                      puts "You have not written any reviews yet. Please go back to the main menu if you want to share a review!"
                      user_path
                    else
                    trail_array =[]
                    delete_review_selection = hiker.trails_by_hiker.map {|trail| trail_array << trail.name}.uniq
                    trail_name_to_delete = $prompt.select("\nPlease choose the name of trail of review you want to delete", delete_review_selection)
                        hiker.delete_review_by_trail_name(trail_name_to_delete)
                        hiker.reload
                        user_path          
                    end     
            else
                user_path
            end
    end 
    
    def specify_trail_name_to_edit
        trail_array = []
        trail_selections = hiker.trails_by_hiker.map {|trail| trail_array << trail.name}.uniq
        trail_name_to_edit = $prompt.select("\nPlease choose the name of trail that you want to review", trail_selections)
        # puts "please enter the trail name of the review you want to edit"
        # trail_name_to_edit = gets.chomp  
    end 

    def edit_existing_rating
        puts "Please enter the rating you wish to give for the updated review"
        rating_to_edit = gets.chomp
    end 

    def edit_existing_comment
        puts "Please enter the comment you wish to update"
        comment_to_edit = gets.chomp
    end 
    def see_all_trails
        trail_array = []
        hiker.trails_by_hiker.map do |trail|
        trail_array << trail.name 
        end.uniq
        puts "You have hiked in: #{trail_array}"
        user_path
    end 
 
end 