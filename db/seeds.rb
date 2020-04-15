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


<<<<<<< HEAD
=======
# make everything lower case
>>>>>>> 33e1e8cb60d0a94d490e12680949468bcf8ffc43
trail1 = HikingTrail.create(
    name: "7 falls",
    location: "boulder",
    difficulty_level: "easy",
<<<<<<< HEAD
    distance: 3,
    traffic: "medium", 
    elevation: 8500,
=======
    distance: 5,
    traffic: "high", 
    elevation: 7500,
>>>>>>> 33e1e8cb60d0a94d490e12680949468bcf8ffc43
    rout_type: "steps"
)

trail2 = HikingTrail.create(
    name: "Evans",
    location: "denver",
    difficulty_level: "easy",
    distance: 14,
    traffic: "high", 
    elevation: 14500,
    rout_type: "road"
)
trail3 = HikingTrail.create(
    name: "Devil's head",
    location: "colden",
    difficulty_level: "easy",
    distance: 8,
    traffic: "desolate", 
    elevation: 8000,
    rout_type: "road"
)

rev1 = Review.create(hiker: hik1, hiking_trail: trail1, rating: 10, user_comment: "Very beautiful!")
rev2 = Review.create(hiker: hik2, hiking_trail: trail2, rating: 9, user_comment: "Very easy!")
rev3 = Review.create(hiker: hik3, hiking_trail: trail2, rating: 5, user_comment: "Too much people")
rev4 = Review.create(hiker: hik2, hiking_trail: trail1, rating: 10, user_comment: "The restaurant inside is amazing!")

