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
        @hiker = Hiker.create(name: hiker_name, member_since: 04/15/2020, followers: 0, stats: nil)
        collect_hiker_choices
    end 

    def collect_hiker_choices
        traffic_input = traffic_choices
        location_input = location_choices
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

end 