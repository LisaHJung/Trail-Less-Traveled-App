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
        @hiker = Hiker.create(name: hiker_name)
        main_menu
    end 

    def main_menu
       puts "Choose current traffic level of a hiking trail you want to get your hike on from the following:"
       puts "High"  #"Wash park on a sunny Saturday."
       puts "Medium" #"I don't mind seeing some friendly faces on the trail."
       puts "Desolate"  # "Qurantine is a style of my life. I don't want to see anyone on the trail."
       
       hiker_choice = gets.chomp.downcase
       traffic_choices(hiker_choice)

    end

    def traffic_choices(hiker_choice)
       if hiker_choice == "High" 
        puts "Choose from following city you want to go hike in:"
        puts "Boulder"
        puts "Denver"
        puts "Golden"
       
       elsif hiker_choice == "Medium"
        puts "Choose from following city you want to go hike in:"
        puts "Boulder"
        puts "Denver"
        puts "Golden"

       else
        puts "Choose from following city you want to go hike in:"
        puts "Boulder"
        puts "Denver"
        puts "Golden"
    end 
end 
end 