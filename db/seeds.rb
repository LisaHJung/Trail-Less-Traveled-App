Review.destroy_all
Hiker.destroy_all
HikingTrail.destroy_all

hik1 = Hiker.create(
    name: "Iuliia", 
    member_since: 05/15/2019,
    followers: 10,
    stats: "7 falls"
)
hik2 = Hiker.create(
    name: "Lisa", 
    member_since: 04/10/2017,
    followers: 50,
    stats: "Devil's head"
)
hik3 = Hiker.create(
    name: "Kirill", 
    member_since: 05/15/2019,
    followers: 5,
    stats: "7 falls"
)
hik4 = Hiker.create(
    name: "Ronda", 
    member_since: 12/30/1998,
    followers: 545,
    stats: "Beer creek"
)



trail1 = HikingTrail.create(
    name: "7 falls",
    location: "The Broadmoor 1 Lake Avenue Colorado Springs",
    difficulty_level: "easy",
    distance: 7,
    traffic: "hard", 
    elevation: 6,
    rout_type: "steps"
)

trail2 = HikingTrail.create(
    name: "Evans",
    location: "Mount Evans Colorado",
    difficulty_level: "easy",
    distance: 14,
    traffic: "hard", 
    elevation: 14.5,
    rout_type: "road"
)

rev1 = Review.create(hiker: hik1, hiking_trail: trail1, rating: 10, user_comments: "Very beautiful!")
rev2 = Review.create(hiker: hik2, hiking_trail: trail2, rating: 9, user_comments: "Very easy!")
rev3 = Review.create(hiker: hik3, hiking_trail: trail2, rating: 5, user_comments: "Too much people")
rev4 = Review.create(hiker: hik2, hiking_trail: trail1, rating: 10, user_comments: "The restaurant inside is amazing!")

binding.pry