Review.destroy_all
Hiker.destroy_all
HikingTrail.destroy_all

hik1 = Hiker.create(
    name: "Iuliia", 
)
hik2 = Hiker.create(
    name: "Lisa", 
)
hik3 = Hiker.create(
    name: "Kirill", 
)
hik4 = Hiker.create(
    name: "Ronda", 
)


# make everything lower case
trail1 = HikingTrail.create(
    name: "7 falls",
    location: "denver",
    difficulty_level: "easy",
    distance: 5,
    traffic: "high", 
    elevation: 7500,
    address: "The Broadmoor Seven Falls"
)
    trail2 = HikingTrail.create(
    name: "Evans",
    location: "boulder",
    difficulty_level: "easy",
    distance: 10,
    traffic: "high", 
    elevation: 14500,
    address: "Mt Evans Rd, Evergreen, CO 80439"
)
trail3 = HikingTrail.create(
    name: "Devil's head",
    location: "denver",
    difficulty_level: "easy",
    distance: 8,
    traffic: "desolate", 
    elevation: 8000,
    address: "S Rampart Range Rd, Sedalia, CO 80135"
)

trail4 = HikingTrail.create(
    name: "Chimney Gulch Trail",
    location: "golden",
    difficulty_level: "medium",
    distance: 2.5,
    traffic: "desolate", 
    elevation: 7000,
    address: "Chimney Gulch Trail, Golden, CO 80401"
)

trail5 = HikingTrail.create(
    name: "Trading Post Trail",
    location: "golden",
    difficulty_level: "difficult",
    distance: 1.4,
    traffic: "medium", 
    elevation: 6500,
    address: "Trading Post Trail, Golden, CO 80401"
)

trail6 = HikingTrail.create(
    name: "Betasso Link Trail",
    location: "boulder",
    difficulty_level: "midium",
    distance: 1.2,
    traffic: "medium", 
    elevation: 5400,
    address: "Boulder, CO 80302"
)

trail7 = HikingTrail.create(
    name: "Bear Peak Trail",
    location: "boulder",
    difficulty_level: "difficult",
    distance: 8.1,
    traffic: "medium", 
    elevation: 8500,
    address: "3980 Broadway, Boulder, CO 80304"
)

trail8 = HikingTrail.create(
    name: "Sugarloaf Mountain Trail Head",
    location: "boulder",
    difficulty_level: "easy",
    distance: 8.1,
    traffic: "desolate", 
    elevation: 10000,
    address: "Sugarloaf Trail, Boulder, CO 80302"
)

trail9 = HikingTrail.create(
    name: "Coalton Trailhead",
    location: "denver",
    difficulty_level: "medium",
    distance: 2.9,
    traffic: "desolate", 
    elevation: 8000,
    address: "3495 McCaslin Blvd, Superior, CO 80027"
)

trail10 = HikingTrail.create(
    name: "Lake Mary Loop Trail",
    location: "denver",
    difficulty_level: "easy",
    distance: 0.8,
    traffic: "medium", 
    elevation: 4013,
    address: "Lake Mary Trail, Denver, CO 80239"
)

trail10 = HikingTrail.create(
    name: "Grays Peak",
    location: "boulder",
    difficulty_level: "difficult",
    distance: 9,
    traffic: "desolate", 
    elevation: 14270,
    address: "Colorado 80435"
)



rev1 = Review.create(hiker: hik1, hiking_trail: trail1, rating: 10, user_comment: "Very beautiful!")
rev2 = Review.create(hiker: hik2, hiking_trail: trail2, rating: 9, user_comment: "Very easy!")
rev3 = Review.create(hiker: hik3, hiking_trail: trail2, rating: 5, user_comment: "Too much people")
rev4 = Review.create(hiker: hik2, hiking_trail: trail1, rating: 10, user_comment: "The restaurant inside is amazing!")


