# Trail Less Traveled
Get your hike on while practicing safe social distancing!

## Table of contents
* [General info](#general-info)
* [Intro Video](#intro-video)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
During this crazy pandemic, us avid hikers and outdoor enthusiasts could find ourselves going stir crazy.

In times, where everyone and their mother are heading to the outdoors to escape cabin fever, what is a hiker to do to find some peace and quiet on the trail?

Trail Less Traveled app helps you find the least busy trail based on your preference of trail crowd level, location, difficulty, length, and elevation.
Keep calm and hike on while practicing safe social distancing!

## Intro Video
[Trail less traveled on YouTube](https://youtu.be/9CrYg-8Soyo)

## Technologies
* ActiveRecord - version 6.0
* Rake version 13.0
* Ruby - version 2.6.1p33
* Sinatra-activerecord - version 2.0
* SQLite3 - version 1.4

## Setup
To run this project, install it locally by cloning the GitHub repository and typing:
```ruby
ruby runner.rb
```

## Code Examples
```ruby
 def user_path
        system "clear"
        banner
        puts "Hi #{hiker.name}!"
        choices = ["Find a hiking trail", "Leave a review for a trail", "See all of my reviews", "See all of the trails I have reviewed", "Exit this app"]
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
            when "See all of the trails I have reviewed"
                system "clear"
                banner
                see_all_trails
        else
            system "clear"
            goodbye
            puts "Thank you for using our App. Have a great day!"
        end
    end
```

## Features
* Browse trails by trail's current traffic, location, difficulty, length,and elevation.
* Leave a review
* See all of user's reviews
* Edit and delete reviews
* See all of the trails user has visited

To-do-list:
* Add API functionality to access hiking trail information and cell phone data to track traffic on respective trail
* Integrate matching photos to trail

## Status
Project is finished with option to expand functionality and DRY out code. 

## Inspiration
The inspiration for Trail Less Traveled came from the current stay at home order during COVID-19 pandemic.
So many people are heading outdoors to escape cabin fever only to find themselves on a crowded trail. 
To help people to get some much needed exercise while practicing safe social distancing, we created an app that helps people find a trail with the lowest crowd level. 

## Contact
Created by [Lisa Jung](https://www.linkedin.com/in/lisa-jung-23304b53/) and [Iuliia Saprykina](https://www.linkedin.com/in/iuliia-saprykina-ab3351100)

Feel free to contact us!!! 

