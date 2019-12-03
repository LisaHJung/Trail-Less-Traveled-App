class Cli
    attr_reader :user
    
    def start_game
        binding.pry

        puts "Welcome to my game! What's your name?"
        user_input = gets.chomp
        @user = User.create(name: user_input)
        puts "Welcome, #{@user.name}"
    end

    def welcome_menu
        puts "Hey, #{@user.name}, What animal is your favorite?"
         choice_menu
    end

    def choice_menu
        puts "1. Pick an animal."
        puts "2. Change my name."
        user_choice = gets.chomp
        if user_choice == "1"
            animal_menu
        elsif user_choice == "2"
            @user.change_name
        else
            "not a valid option"
            exit
            system("clear")
        end
    end

    def animal_menu
        @user_animal = gets.chomp.downcase

        if @user_animal == "cat"
            puts "meow, meow, #{@user.name}"
            favorite_color
        elsif @user_animal == "dog"
            puts "woof, woof, #{@user.name}"
        else
            puts "No good, please choose a better animal:"
            animal_menu
        end
    end

    def favorite_color
        puts "what's fav color"
        @fav_color = gets.chomp
        animal_color
    end

    def animal_color
        puts "Your animal is #{@fav_color} #{@user_animal}"
    end
end